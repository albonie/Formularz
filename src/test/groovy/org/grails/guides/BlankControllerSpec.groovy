package org.grails.guides

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class BlankControllerSpec extends Specification implements ControllerUnitTest<BlankController> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
