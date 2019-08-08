Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4F3C433FF
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 15:11:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2059E21882
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 15:11:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UmNgttNt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732414AbfHHPLv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 11:11:51 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58339 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732576AbfHHPLu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Aug 2019 11:11:50 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190808151148euoutp0237d3433bbbd9a3714751ae616bf20f3b~4_zyuwi450228602286euoutp02K
        for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2019 15:11:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190808151148euoutp0237d3433bbbd9a3714751ae616bf20f3b~4_zyuwi450228602286euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1565277108;
        bh=o6ZKkqNmsI5oZAlpCdjYIuKkKjEehwZ62ztXViPzKDs=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=UmNgttNtIVspOLjtFBr/rg6u0KqNmxBgGQAhFkuVNfaTdjCikUL+3BQVDyjnbcavn
         Eur+mOTdr9bWXf+p8aGccPJfI8HxgmoXsgGh709cfO+by92Qk+CiKtGQitEh1kLEwD
         3T1KK1Dw7zmUzizjcRliuY2+4lmx+AK+akNDSpyM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190808151147eucas1p1f921314427d6f9e19c6c7ed504cd425a~4_zx_2p460265402654eucas1p1a;
        Thu,  8 Aug 2019 15:11:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 6C.FF.04374.3BB3C4D5; Thu,  8
        Aug 2019 16:11:47 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190808151147eucas1p1c70e28263f41d0199de59e377d066fab~4_zxT4Ar60268102681eucas1p1b;
        Thu,  8 Aug 2019 15:11:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190808151146eusmtrp26f9f3655fffd375484aed7a0e680ca57~4_zxFvEbV0186101861eusmtrp26;
        Thu,  8 Aug 2019 15:11:46 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-ef-5d4c3bb3d99d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 75.1E.04166.2BB3C4D5; Thu,  8
        Aug 2019 16:11:46 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190808151146eusmtip15cd49cea167e56158c848419fa45afdd~4_zwsnP_N3242532425eusmtip12;
        Thu,  8 Aug 2019 15:11:46 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos542x: Move MSCL subsystem clocks to
 its sub-CMU
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <cc516c44-862c-ab83-84ad-67e90e088067@samsung.com>
Date:   Thu, 8 Aug 2019 17:11:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808121839.23892-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djPc7qbrX1iDc6tk7PYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbnHxlKvFv2sbWSzan75kduD0eH+jld1j06pONo++LasY
        PT5vkgtgieKySUnNySxLLdK3S+DKaPsyh73gIFfF9ZUd7A2MJzm6GDk5JARMJI7sesLexcjF
        ISSwglFif9cjFgjnC6PE8SPfGCGcz4wSb9eeYYNpuddyihkisZxRYvqcj1Atbxkl1t3+wwRS
        JSwQJbHy5kMWEFtEoF5ix6V3bCBFzCBzp084AZZgEzCU6D3axwhi8wrYSVz5eZoVxGYRUJFY
        2HAVrEZUIELi04PDrBA1ghInZz4Bi3MC1e95eQCsl1lAXKLpy0pWCFteYvvbOWDnSQjsYpd4
        u/IQI8TdLhJ7r0xhgrCFJV4d38IOYctI/N85nwmioZlRomf3bXYIZwKjxP3jC6C6rSUOH78I
        tIIDaIWmxPpd+hBhR4nL31exgYQlBPgkbrwVhDiCT2LStunMEGFeiY42IYhqFYnfq6ZDnSAl
        0f3kP8sERqVZSF6bheSdWUjemYWwdwEjyypG8dTS4tz01GLjvNRyveLE3OLSvHS95PzcTYzA
        hHT63/GvOxj3/Uk6xCjAwajEw9ug6BMrxJpYVlyZe4hRgoNZSYT3XplnrBBvSmJlVWpRfnxR
        aU5q8SFGaQ4WJXHeaoYH0UIC6YklqdmpqQWpRTBZJg5OqQbG5pIKrThHroQp95j51JafWrtr
        SWexx4m659ozWtXyzzG2O9794h2Q5avMfFP8uZl0V3Pg732M1xpk2E5N02zr+CZ+bukurQ2r
        ZtyJy9aXTjCaFz/36tEPQZpuYczigq31qwNjrxb3Puh8ftm3xIj1W/n1Uw6aYjyXjyoWvxPw
        /Kt+snPlO3klluKMREMt5qLiRADH6GKPRAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7qbrH1iDRqn6VtsnLGe1eL6l+es
        FufPb2C3+Nhzj9Vixvl9TBZrj9xlt7h4ytXi37WNLBbtT18yO3B6vL/Ryu6xaVUnm0ffllWM
        Hp83yQWwROnZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunb
        JehltH2Zw15wkKvi+soO9gbGkxxdjJwcEgImEvdaTjF3MXJxCAksZZT4s/QxkMMBlJCSmN+i
        BFEjLPHnWhcbRM1rRokXHcvYQRLCAlESK28+ZAGxRQTqJb5MucgEUsQs8IVR4ue3x4wQHRMZ
        JQ5ffQHWwSZgKNF7tI8RxOYVsJO48vM0K4jNIqAisbDhKtgkUYEIicM7ZkHVCEqcnPkELM4J
        VL/n5QGwOLOAusSfeZeYIWxxiaYvK1khbHmJ7W/nME9gFJqFpH0WkpZZSFpmIWlZwMiyilEk
        tbQ4Nz232FCvODG3uDQvXS85P3cTIzD+th37uXkH46WNwYcYBTgYlXh4GxR9YoVYE8uKK3MP
        MUpwMCuJ8N4r84wV4k1JrKxKLcqPLyrNSS0+xGgK9NxEZinR5HxgasgriTc0NTS3sDQ0NzY3
        NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cDov/3qj9K9WYJvgvet3S+wJLStY+6kGRMP
        pDMXsaw4/H5+8Xr+5fazHqUcFf9k5PI5f6VojIDSvllVJ1NuWxxc0qhZfuSrfu6tqvkd6nlf
        HnWaaSz9+cjV+33JsVfG/5O3c/zfOe0R15tP5X4b/uk/CC++n72OS+/ahdXeSjqzWz68f1kh
        3BLRpMRSnJFoqMVcVJwIAMfxw/TVAgAA
X-CMS-MailID: 20190808151147eucas1p1c70e28263f41d0199de59e377d066fab
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190808121846eucas1p12022cc4a5c23af44e46c459a0c3c5746
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190808121846eucas1p12022cc4a5c23af44e46c459a0c3c5746
References: <CGME20190808121846eucas1p12022cc4a5c23af44e46c459a0c3c5746@eucas1p1.samsung.com>
        <20190808121839.23892-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 8/8/19 14:18, Marek Szyprowski wrote:
> M2M scaler clocks require special handling of their parent bus clock during
> power domain on/off sequences. MSCL clocks were not initially added to the
> sub-CMU handler, because that time there was no driver for the M2M scaler
> device and it was not possible to test it.
> 
> This patch fixes this issue. Parent clock for M2M scaler devices is now
> properly preserved during MSC power domain on/off sequence. This gives M2M
> scaler devices proper performance: fullHD XRGB32 image 1000 rotations test
> takes 3.17s instead of 45.08s.
> 
> Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Stephen, could you apply this patch directly to clk-fixes, on top of
my patches:

[v2,2/2] clk: samsung: exynos5800: Move MAU subsystem clocks to MAU sub-CMU
[v2,1/2] clk: samsung: Change signature of exynos5_subcmus_init() function 

? Regression that these 3 patches are fixing is not new, it has been
introduced much earlier than 5.3-rc1, however it's quite serious and it
would be good to have the fixes already in 5.3 release.  
If that's your preference I will just queue these patches for coming
merge window.

-- 
Thanks,
Sylwester
