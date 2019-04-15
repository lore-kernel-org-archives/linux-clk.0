Return-Path: <SRS0=I40h=SR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B8FC10F0E
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 04:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DBC220833
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 04:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbfDOE6X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Apr 2019 00:58:23 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:47518 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfDOE6X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Apr 2019 00:58:23 -0400
X-AuditID: c0a8fbf4-501ff700000014c1-2f-5cb40f6d7620
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 76.84.05313.D6F04BC5; Mon, 15 Apr 2019 06:58:21 +0200 (CEST)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 15 Apr 2019 06:58:10 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "leonard.crestez@nxp.com" <leonard.crestez@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "ping.bai@nxp.com" <ping.bai@nxp.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "angus@akkea.ca" <angus@akkea.ca>,
        "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>,
        "abel.vesa@nxp.com" <abel.vesa@nxp.com>,
        "linux-pm@lists.infradead.org" <linux-pm@lists.infradead.org>,
        "yibin.gong@nxp.com" <yibin.gong@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mm-evk: Add BD71847 PMIC
Thread-Topic: [PATCH 4/4] arm64: dts: imx8mm-evk: Add BD71847 PMIC
Thread-Index: AQHU8TlrwuMWcWl100aOAwTGOBl6vKY8i7WA
Date:   Mon, 15 Apr 2019 04:58:09 +0000
Message-ID: <f3341e61076f91d163f1eb48d5ee55267d1d5c57.camel@fi.rohmeurope.com>
References: <cover.1555077720.git.leonard.crestez@nxp.com>
         <7df309d19cf7f311afe736c95666afe8697e1e5a.1555077720.git.leonard.crestez@nxp.com>
In-Reply-To: <7df309d19cf7f311afe736c95666afe8697e1e5a.1555077720.git.leonard.crestez@nxp.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.203.185.94]
Content-Type: text/plain; charset="utf-8"
Content-ID: <264703FD2064DA42BC775DA1B8FD36ED@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0hTURzHOTt36+q8dlraTisD14PeahRcIsqEYtmDoH8iJLu1m9P2kLvN
        XJHuDyOdke8eI6Nk1FqtdLPWi9JRVEYPJIa1NMzwRQ3tZVpp926l/nV/9/d9fDjcc0koc0sU
        ZLbexHJ6RquURBNNzl+eZbqpjRnJvk4RfbH1EaC/1dyBdNf7IKAbvEGCdtXcJmhn+6CYHjze
        IaZtI5ch3XyCo6+8aJbQo4EGgu5tlNOl9c9BKqWqsTmByuMqkai8jkJVQ+iWSFX2J1n11TNn
        u2SXdM1expS3IztLn7R2j1TjH6qAuS5pfl2V2QqKpDZAkhitxL6fc20gmpShAMD1A69ENhDF
        vzwB+ORVs+CRoDXY9maKsI5DNwG+YM8X/BD5ID7WfhYKwnS0Hj/8YoURUxo+VxkSR+YVeNDR
        AIUeAs3HFR8swkihbbjtuyKCLQPYGRwJY6PQbtxf7A3XAJSAS6yh8B4iOfZ0D4UrMULYce8l
        jMzxuK9r9N8+EQ/3VoVREC3C1+8kRaKpuNvVJonMibi6tDN8FApNw0/PfCTKwQz7JIJ9Im2f
        lLZPStsnpc8DsQtgHZOtzWJMbMpyjjUv5wwaHf/YZ9B5QOSDf7sFxvyb/ACRQBlDlfzwZsjE
        TJ7RovODmaRIGU9tJhozZLF7DWqLhjFqMjmzljX6ASahMo5CxbydUjOWQyxn+C/NIgmlnDp4
        qTpDhgTyAZbNZbn/6mySVGIqGMuXTuPYLDZ/f7bWNCGLyCihPFoRZ2T1apZjzCZNpnBTMo38
        VRGkGJ67UYhTxlxGx28j0RawhGyq66yF5OfmnlooI/QGPauQUwMUb0WCVWPWj4P6gZw/73Rq
        WFBj+H9gvKefR4h4RPXSKwLCxExICitYPNs7K3C0wLl6/gXHjRPW9PvRO25Tac6RtVUFr6TP
        0lc58tQP7zGhU0+aOtxHE65V/u6rfbzux5aRwn2PzpXnOxf6dUdyTMEFwxY6gAO58e53Y28f
        DLbSRE5RH9dW1OJzlyYlb91gO0O/1t5Q98RDYh68+6nutLU+6+rhy60FO5WEUcOkLIackfkL
        RF5MisADAAA=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gRnJpLCAyMDE5LTA0LTEyIGF0IDE0OjEwICswMDAwLCBMZW9uYXJkIENyZXN0ZXogd3JvdGU6
DQo+IFRoZSBCVUNLMiByZWd1bGF0b3IgaXMgdXNlZCBmb3IgY3B1ZnJlcSB2b2x0YWdlIGNvbnRy
b2wsIG90aGVyd2lzZQ0KPiBjb25maWd1cmF0aW9uIGlzIG1vc3RseSBzdGF0aWMuDQo+IA0KPiBU
aGlzIHVzZXMgdGhlIG5ld2x5LWltcGxlbWVudGVkIHJvaG0scmVzZXQtc252cy1wb3dlcmVkIHBy
b3BlcnR5IHRvDQo+IHByb3Blcmx5IGhhbmRsZSB0aGUgU05WUyBzdGF0ZSBvZiBpbXg4bW0uDQo+
IA0KPiBCZXR3ZWVuIEJENzE4MzcgYW5kIEJENzE4NDcgdGhlIEJVQ0szLzQgcmVndWxhdG9ycyB3
ZXJlIHJlbW92ZWQgYnV0DQo+IGRhdGFzaGVldCBhbmQgYm9hcmQgc2NoZW1hdGljcyBrZXB0IHRo
ZSBuYW1lcyBmb3IgQlVDSzUvNi83LzguIFRoZQ0KPiBkcml2ZXIgaG93ZXZlciByZW51bWJlcmVk
IDUvNi83LzggdG8gMy80LzUvNi4gVXNlIHRoZSBuYW1lcyBmcm9tIERUDQo+IGJpbmRpbmdzIGFu
ZCBhZGQgY29tbWVudHMgdG8gc2lnbmFsIHRoaXMuDQoNClllcC4gSSBoYWQgaGFyZCB0aW1lIHdo
ZW4gZGVjaWRpbmcgdGhlIG5hbWluZyBmb3IgYnVja3MuIEJ1dCBJIGZvdW5kDQpsZWF2aW5nIHRo
ZSBnYXAgaW4gYnVjayBuYW1lcyBjb25mdXNpbmcsIGl0IG1ha2VzIG9ubHkgc2Vuc2UgaWYgQkQ3
MTg0Nw0KdXNlciBhbHNvIGtub3dzIHRoZSBCRDcxODM3LiBBbHNvLCBJIGhhZCBvbmx5IHNlZW4g
dGhlIGRyYWZ0IHZlcnNpb24gb2YNCkJENzE4NDcgZGF0YS1zaGVldCAoZHJhZnQgZGVyaXZlZCBm
cm9tIEJENzE4MzcgZGF0YS1zaGVldCkgYmFjayB0aGVuLiBJDQp0aG91Z2h0IHRoZSBuYW1pbmcg
b2YgYnVja3Mgd291bGQgYmUgY2hhbmdlZCBpbiBmaW5hbCB2ZXJzaW9uLi4uDQoNCj4gU2lnbmVk
LW9mZi1ieTogTGVvbmFyZCBDcmVzdGV6IDxsZW9uYXJkLmNyZXN0ZXpAbnhwLmNvbT4NCkFja2Vk
LUJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4N
Cg0KQnIsDQogICAgTWF0dGkgVmFpdHRpbmVuDQoNCg==
