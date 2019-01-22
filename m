Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BF9C37122
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 00:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26D2C21721
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 00:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="D5QxBd1z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbfAVA1Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 19:27:25 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:10085 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfAVA1Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 19:27:25 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20190122002721epoutp01834eae2bfb391b6d7c82ce0a32f4a4d7~8BBCsYlqc0430904309epoutp01r
        for <linux-clk@vger.kernel.org>; Tue, 22 Jan 2019 00:27:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20190122002721epoutp01834eae2bfb391b6d7c82ce0a32f4a4d7~8BBCsYlqc0430904309epoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1548116841;
        bh=XcOY9JgPKbpw8lGenaFBUh5gbv+Y5B4qfqESn9sMyNg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=D5QxBd1z5oJ1CzrLZy7d0XcHJZI34o/klXbwS7o1DlFXOnseXXHPMZLw0XRKjVRV6
         oxR0/CrnPdkWTyG1rgC00cl7YfQJ/KkmxPR4fEeFC9AyoPEYFyUiuiq0eytoSTKTrI
         yVk2wiTwa+mqtsxnzNCTfhXxdCgYyLKVCZKJg06U=
Received: from epsmges1p1.samsung.com (unknown [182.195.40.153]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20190122002717epcas1p3777da710fb6ae7bd94673e5601d705a6~8BA_uWD1Q0364003640epcas1p3K;
        Tue, 22 Jan 2019 00:27:17 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        4A.1B.04074.163664C5; Tue, 22 Jan 2019 09:27:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190122002713epcas1p27b73f63712369af5903766c62c3c1156~8BA7ExQRC1308613086epcas1p2t;
        Tue, 22 Jan 2019 00:27:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190122002713epsmtrp27460c52bf80fc4bed74fece183724665~8BA7DY7fA2589525895epsmtrp2N;
        Tue, 22 Jan 2019 00:27:13 +0000 (GMT)
X-AuditID: b6c32a35-27fff70000000fea-89-5c4663617261
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        3C.E8.03971.163664C5; Tue, 22 Jan 2019 09:27:13 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190122002713epsmtip1da115f98c7650e7c73093fa6f4eba940~8BA62d0UX3000830008epsmtip1p;
        Tue, 22 Jan 2019 00:27:13 +0000 (GMT)
Subject: Re: [PATCH v4 4/5] dt-bindings: clk: exynos5433: add imem clock
To:     Rob Herring <robh@kernel.org>, Chanwoo Choi <cwchoi00@gmail.com>
Cc:     Kamil Konieczny <k.konieczny@partner.samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <0a803aee-b8f2-0d9b-dc63-f6cee9d4d42f@samsung.com>
Date:   Tue, 22 Jan 2019 09:27:12 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190121145132.GA19195@bogus>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMJsWRmVeSWpSXmKPExsWy7bCmrm5isluMQfsxK4uNM9azWjw7qm0x
        /8g5Vou+ff8ZLfofv2a2OH9+A7vFx557rBYzzu9jslh75C67xdLrF5ks/u/ZwW5x+E07qwOP
        x5p5axg9ds66y+6xaVUnm8fBd3uYPPq2rGL0+LxJLoAtKtsmIzUxJbVIITUvOT8lMy/dVsk7
        ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hGJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+
        cYmtUmpBSk6BZYFecWJucWleul5yfq6VoYGBkSlQYUJ2xumbn1kK9vBUnFzE1cDYytXFyMkh
        IWAi8fXtLeYuRi4OIYEdjBIzN3cxQjifGCUaT5xhg3C+MUo8ePSTFabl35MrrBCJvYwSXVMO
        QznvGSXePFvODFIlLOAh0bTlBzuILSLgInHlx252kCJmga3MEndf/wEbxSagJbH/xQ02EJtf
        QFHi6o/HjCA2r4CdRPOMGWA2i4CqxMLTa1hAbFGBCImO+6vZIGoEJU7OfAIW5xTQluh7fY8J
        xGYWEJe49WQ+lC0v0bx1Nth3EgKT2SU2TLjGAvGDi8T31sWMELawxKvjW9ghbCmJz+/2skHY
        1RIrTx5hg2juYJTYsv8CNACMJfYvnQy0gQNog6bE+l36EMv4JN597WEFCUsI8Ep0tAlBVCtL
        XH5wlwnClpRY3N4JNd5DYvPNXvYJjIqzkLwzC8kLs5C8MAth2QJGllWMYqkFxbnpqcWGBYbI
        0b2JEZyAtUx3ME4553OIUYCDUYmHl+Oca4wQa2JZcWXuIUYJDmYlEV4xbbcYId6UxMqq1KL8
        +KLSnNTiQ4ymwNCeyCwlmpwPzA55JfGGpkbGxsYWJoZmpoaGSuK86x2cY4QE0hNLUrNTUwtS
        i2D6mDg4pRoYtRRXdwR1PZtoUC5lWvp8slyRgXjP2ja3H08l21k5GC4Y5eqUmdUJPNOP+nlP
        7Vpt38k519lSLthxuT0Rz1T2DGTJ9/rH4Ds7W1dfJN1w3qqXNhfvntc/s32t2OEtn7fXfTjp
        LzMn1WlRkNPnp+09TbK7d+lO02L8dVxZOt/wjmJQi/I/LyYlluKMREMt5qLiRAA7RdM21gMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsWy7bCSnG5isluMwf87ghYbZ6xntXh2VNti
        /pFzrBZ9+/4zWvQ/fs1scf78BnaLjz33WC1mnN/HZLH2yF12i6XXLzJZ/N+zg93i8Jt2Vgce
        jzXz1jB67Jx1l91j06pONo+D7/YwefRtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfG6ZufWQr2
        8FScXMTVwNjK1cXIySEhYCLx78kV1i5GLg4hgd2MEuu2zmaESEhKTLt4lLmLkQPIFpY4fLgY
        ouYto8TiQ++ZQGqEBTwkmrb8YAexRQRcJK782A1mMwvsZJaYf9kSaiiTxJLZb8Ea2AS0JPa/
        uMEGYvMLKEpc/fEYbBmvgJ1E84wZYDaLgKrEwtNrWEBsUYEIibMv10HVCEqcnPkELM4poC3R
        9/oeE8QydYk/8y4xQ9jiEreezIeKy0s0b53NPIFReBaS9llIWmYhaZmFpGUBI8sqRsnUguLc
        9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgONTS3MF4eUn8IUYBDkYlHl6Oc64xQqyJZcWVuYcY
        JTiYlUR4xbTdYoR4UxIrq1KL8uOLSnNSiw8xSnOwKInzPs07FikkkJ5YkpqdmlqQWgSTZeLg
        lGpgVNfZu7Jh7vZ9+0+ke23JPaveU8+db701YcnBDUZ5HC+K0pbOlQyM79q5ctM+5x25XCdf
        x23YxrfiuhrTh/VWZ7ZXpeTG5jklezu5b6u5+txe/dPETe86RFIi+0ySrgme0k7lZ3Vbt2FH
        ucmlxCKpxg+3hFgfZHkasCpOKD8aJXZ26ct/7EfMlFiKMxINtZiLihMBI1qEnr8CAAA=
X-CMS-MailID: 20190122002713epcas1p27b73f63712369af5903766c62c3c1156
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a
References: <CGME20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a@eucas1p2.samsung.com>
        <20190118131639.17578-1-k.konieczny@partner.samsung.com>
        <20190118131639.17578-5-k.konieczny@partner.samsung.com>
        <CAGTfZH1K-f9kxVourd_-hfDoLXsjyrCL+5FLDycsR4kRG9mpGg@mail.gmail.com>
        <20190121145132.GA19195@bogus>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19. 1. 21. 오후 11:51, Rob Herring wrote:
> On Sat, Jan 19, 2019 at 09:40:10PM +0900, Chanwoo Choi wrote:
>> Hi Kamil,
>>
>> This version only adds following two clocks without that other clocks
>> be included in imem block.
>> - CLK_ACLK_SLIMSSS
>> - CLK_PCLK_SLIMSSS
>>
>> Usually, the users only refer to
>> 'include/dt-bindings/clock/exynos5433.h' in order to get the supported
>> clocks. It means that if there are different between the clock list in
>> 'include/dt-bindings/clock/exynos5433.h' and the supported clock list
>> of drivers/clock/', it make the confusion for users. So,
>> 'include/dt-bindings/clock/exynos5433.h' have to define the only
>> supported clock ids.
>>
>> Please remove other clock ids except for CLK_ACLK_SLIMSSS/CLK_PCLK_SLIMSSS.
> 
> And add clocks 1-by-1 instead? The binding headers are a pain to merge 
> because they are a dts and driver dependency. Having a complete header 
> is preferred unless there is doubt in the correctness of it.

As you commented, I knew the dependency between dt-binding head file and
drivers/dts. But, IMO, I'm not sure that it is right to define
the unsupported ID in dt-bindings header file because we don't know
the correctness without any real test. The author explained why dropped
the clocks except for two clocks on cover-letter. It means that the clocks
except for two clocks might be never added to clock driver because He was
unable to test them..

> 
> The driver can warn users about unsupported IDs.
> 
> Rob
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
