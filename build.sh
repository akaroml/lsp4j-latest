#!/bin/bash
# Script to build and update this p2 update site with the most latest LSP4J source.

rm -rf ./lsp4j/ \
&& git clone --single-branch -b dt-capabilities https://github.com/akaroml/lsp4j.git \
&& ./lsp4j/gradlew -p lsp4j build install generateP2Build --refresh-dependencies \
&& mvn -f ./lsp4j/releng/pom.xml clean verify \
&& rm -rf ./p2/ \
&& unzip -o ./lsp4j/releng/p2/target/lsp4j.p2-repository-0.9.0-SNAPSHOT.zip -d ./p2/
