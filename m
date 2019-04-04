Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3187AC4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3ABA20855
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="ISjZJrDl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfDDIAE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 04:00:04 -0400
Received: from mout.gmx.net ([212.227.15.18]:37907 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726031AbfDDIAE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Apr 2019 04:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554364795;
        bh=tKaCWkj0cKu0yAMeQBYUolSuep7uqRa3nEpRf4rre8g=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ISjZJrDlrkkl9G2xt3HdheY7Prh+ZTshlpC3ZnTi5E85Jlmnza3B5pS8bloQNfsIY
         6yPIbTZ/FLhwUzuTFlyaQnhd3dMRc/qkn3AjGZ3hIdSy7Na+d3t8yHqYUlCvuHlOsY
         +BSkco87CDem1Xnk+9NbxL7GiAn5sCxsAWoLpbz8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.11.10] ([185.137.174.251]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MLeoF-1hCEP20KVn-000tie; Thu, 04
 Apr 2019 09:59:55 +0200
Subject: Re: [PATCH v2] clk: x86: Add system specific quirk to mark clocks as
 critical
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
References: <20190328124939.23139-1-dave.mueller@gmx.ch>
 <20190403140857.1130-1-dave.mueller@gmx.ch>
 <ed8c07ff-5719-9179-424c-13b0891605f7@redhat.com>
 <CAHp75VdT_4e1F51YfRVtmPBmT+ZbwvjVGJAY5uhC=QMKxyANPQ@mail.gmail.com>
 <d8f96161-9ab8-2300-35fb-9e2b2e442c1d@redhat.com>
From:   =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Organization: Privat
Message-ID: <f0ec3df1-f142-29c6-5f1e-baab95f93665@gmx.ch>
Date:   Thu, 4 Apr 2019 10:00:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <d8f96161-9ab8-2300-35fb-9e2b2e442c1d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:CVcui8T+QxsxNXSMOfny90BWgWmfCRb6UlziYBMdxJ/2Fs+269X
 IEDSm7kCJqmTVcq7an5qGttI8z3DLcdYWXUm+pIighgkz9G+lKX86RjRr4DxPqd5L1CuGFM
 m6Lcu/gp3ANGe+Azxtmjjn45zQqXgcDqhaaTo0Jhomu9dR1iojgxPEGS1rmXnYwUQVljhmD
 V2V3VvU5IcFRpKrBhG1Og==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EdUh1UrSMdE=:Z0w0HmMvaw+oKEt+7nhFol
 o7yMZwmuGYaB2E25870YSU5PpUSvIPaDBBUgl9iTnUnldFTrrlhV3G0jr6g0hmfKwOTdqrWO0
 NOT4CMv7R+mEyyJc1By1z8VJ5F+gSZg9UjcDlf2U5vObZgz+8o9hg4Cxw/lX/83ThxCOgsqEa
 hdvk76jCqaqc75pqy6DAkYx14SXTeoApEyEMu2pNSSnE0/GrC5QnED0HwNU4+MCb/gIwqFeYY
 x8cHR25MXejd1CWJFUgJAbU/CP7ZS1n7AjCHzt6VvL4PXp/bos9BajNj7lhqd3KA72DHIxGmj
 OFT1BWeCyjxOGmpTRUfyv+I1BAohNeTrHiRXeA6uUmaGbeKxICr9tQN9GACjiwLvg3/O8zLQs
 GiU0Y3aGwweyPeM6za1+VOGGmhKJYk7cOZqTGq9GYuPs6ZMMt3Cn8Jd1VSDg2ivNDbt7biTUD
 TVrHd1dfryQTgZzu0pEP/E13NpD28kyNOS2hifTKUWTbIxnZ+Z1sgtITXTvaXgufHWMueFhP1
 LSLBsT396SeHKli+/6/uev11UhnkframwJtUUdi7DWJOTixQ8w3HmP3ZcuX0Ucr4bZ7LoBD6l
 /LHrSI1P416Jl6vkSG3ckG+oRRAovgcT4QlIjeEo3OcpOMnyvJMXTgJSQFgOgDcHl9MKgKkbW
 +/TllDGQ1YXoANkCCmY8QnhnHDu6dyxWLxDIgZ2to9RhASL27GSRWYuCCFxjzjKOe+mDMtqmc
 r9Ma+K5cDB4jXRYyavc3Tvjp1s27khi8xazRTZ8qeQ3LchdLF7oBDTkvuJ3iL+6zkm9MatXu2
 L8DPfPSsaKUtx+wMzR0CbzIjsvrZ4Oc8KMVofjIgyvYwkzKqCBcySX+qAfATxtteE3sDyrfrW
 AkorCpNFh0fdwu7LNNsmPvB/HLlW08fELaeXSdhAaYIAIDsC/u3XjMYRtckA/QY+MDq80mgwX
 a3pmUXIOHgw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGFucyBkZSBHb2VkZSB3cm90ZToNCj4gT24gMDMtMDQtMTkgMTc6MzYsIEFuZHkgU2hldmNoZW5r
byB3cm90ZToNCj4+IE9uIFdlZCwgQXByIDMsIDIwMTkgYXQgNjozMSBQTSBIYW5zIGRlIEdvZWRl
IDxoZGVnb2VkZUByZWRoYXQuY29tPiB3cm90ZToNCj4+PiBPbiAwMy0wNC0xOSAxNjowOCwgRGF2
aWQgTcO8bGxlciB3cm90ZToNCj4+DQo+Pj4+IMKgwqDCoMKgwqDCoCBjbGtfZGF0YS0+YmFzZSA9
IHBtY19yZWdtYXA7IC8qIG9mZnNldCBpcyBhZGRlZCBieSBjbGllbnQgKi8NCj4+Pj4gwqDCoMKg
wqDCoMKgIGNsa19kYXRhLT5jbGtzID0gcG1jX2RhdGEtPmNsa3M7DQo+Pj4+ICvCoMKgwqDCoCBp
ZiAoZCkgew0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsa19kYXRhLT5jaGtfY3Jp
dGNsa3MgPSB0cnVlOw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX2luZm8oIiVz
IGNyaXRjbGtzIHF1aXJrIGVuYWJsZWRcbiIsIGQtPmlkZW50KTsNCj4+Pj4gK8KgwqDCoMKgIH0N
Cj4+Pj4NCj4+Pj4gwqDCoMKgwqDCoMKgIGNsa2RldiA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rl
cl9kYXRhKCZwZGV2LT5kZXYsDQo+Pj4+ICJjbGstcG1jLWF0b20iLA0KPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUExBVEZPUk1fREVWSURfTk9ORSwNCj4+Pg0KPj4+IE5v
cm1hbGx5IEkgd291bGQgYmUgZmluZSB3aXRoIHlvdXIgY2hvaWNlIHRvIHVzZSBkbWlfZmlyc3Rf
bWF0Y2goKSwNCj4+PiBidXQgc2luY2UNCj4+PiB5b3UgbmVlZCB0byByZXNwaW4gYW55d2F5LCBj
YW4geW91IGNoYW5nZSB0aGlzIHRvOg0KPj4+DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoZG1p
X2NoZWNrX3N5c3RlbShjcml0Y2xrX3N5c3RlbXMpKSB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY2xrX2RhdGEtPmNoa19jcml0Y2xrcyA9IHRydWU7DQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfaW5mbygiJXMgY3JpdGNsa3MgcXVpcmsgZW5h
YmxlZFxuIiwgZC0+aWRlbnQpOw0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+DQo+Pj4gVGhh
dCB3aWxsIGFsbG93IHlvdSB0byBkcm9wIHRoZSAnZCcgdmFyaWFibGUgZGVjbGFyYXRpb24gYWxs
IHRvZ2V0aGVyDQo+Pj4gYW5kIGlzDQo+Pj4gc29tZXdoYXQgY2xlYW5lciBJTUhPLg0KPj4NCj4+
IHByX2luZm8oKSByZWxpZXMgb24gaXQgQUZBSUNTLg0KPiANCj4gQWggcmlnaHQgSSBtaXNzZWQg
dGhhdCwgSSB3b3VsZCBqdXN0IGRvOiBwcl9pbmZvKCJTeXN0ZW0gaXMgb24gY3JpdGNsa3MNCj4g
cXVpcmsgbGlzdCwgY3JpdGNsa3MgcXVpcmsgZW5hYmxlZFxuIik7DQo+IGJ1dCBrZWVwaW5nIHRo
ZSBzb2x1dGlvbiB3aXRoIGlkZW50IGlzIGZpbmUgdG9vLg0KDQpJZiBpdCBpcyBPSywgSSB3aWxs
IGtlZXAgdGhlICJkbWlfZmlyc3RfbWF0Y2goKSIgaW1wbGVtZW50YXRpb24uDQoNCg0KRGF2ZQ0K
