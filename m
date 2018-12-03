Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB79C04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 10:44:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6400821527
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 10:44:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WxjEQOEj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6400821527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbeLCKo4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 05:44:56 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:36806 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbeLCKo4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Dec 2018 05:44:56 -0500
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20181203104423epoutp040f0fbc83675d8d82f53bacfcb10f8197~szLgQAACf3264132641epoutp04Z;
        Mon,  3 Dec 2018 10:44:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20181203104423epoutp040f0fbc83675d8d82f53bacfcb10f8197~szLgQAACf3264132641epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543833863;
        bh=2KIMBmcJXQmEfagPOMATbZqtKEZhtwG8/kf4Fc/3+Hs=;
        h=Subject:To:Cc:From:Date:In-reply-to:References:From;
        b=WxjEQOEjT2kBa7SFuko4hjTtMYor2vuGWZV7/I7dkGlmm1y9nYu3qWa6LPJl/q7eF
         891+oYiP32XMM+rw62di59PR9GhuD4CodilnmU+Hltt5oIxmkWnuBy9K4yydLAEZQz
         VYKUgh4Zs3nPPPS5mi/goXl0KYmrclfYDta77Yng=
Received: from epsmges2p4.samsung.com (unknown [182.195.42.72]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20181203104422epcas2p4bc47bc0549b10d80db893a6209170904~szLf5OEib2632426324epcas2p4J;
        Mon,  3 Dec 2018 10:44:22 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        A3.DA.04055.609050C5; Mon,  3 Dec 2018 19:44:22 +0900 (KST)
Received: from epsmgms2p2new.samsung.com (unknown [182.195.42.143]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20181203104422epcas2p39e4af6e6c2dcb73c29d6d34f96449079~szLfoWYFQ0915309153epcas2p3n;
        Mon,  3 Dec 2018 10:44:22 +0000 (GMT)
X-AuditID: b6c32a48-3c1ff70000000fd7-6b-5c050906c8d8
Received: from epmmp1.local.host ( [203.254.227.16]) by
        epsmgms2p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        8B.AD.03627.609050C5; Mon,  3 Dec 2018 19:44:22 +0900 (KST)
Received: from [106.116.147.40] by mmp1.samsung.com (Oracle Communications
        Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with ESMTPA id
        <0PJ500HZ7PTTV880@mmp1.samsung.com>; Mon, 03 Dec 2018 19:44:22 +0900 (KST)
Subject: Re: [PATCH v2 3/5] arm64: dts: bindings: document imem clock
To:     Stephen Boyd <sboyd@kernel.org>, k.konieczny@partner.samsung.com
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <be16bd2d-6f71-b273-a708-3781cdd9179d@samsung.com>
Date:   Mon, 03 Dec 2018 11:44:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.2.1
MIME-version: 1.0
In-reply-to: <154353492516.88331.1979737561234011163@swboyd.mtv.corp.google.com>
Content-type: text/plain; charset="utf-8"
Content-language: en-GB
Content-transfer-encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7bCmhS4bJ2uMweZH+hYbZ6xntbj+5Tmr
        xfwj51gt+vb9Z7Tof/ya2eL8+Q3sFh977rFazDi/j8li7ZG77BZLr19ksmjde4Td4t+1jSwO
        PB5r5q1h9Ni0qpPN4+C7PUwefVtWMXp83iQXwBrFZZOSmpNZllqkb5fAlfHs8gPmgi9CFWdn
        f2NqYPzF28XIySEhYCKxc/Yhpi5GLg4hgR2MEqd//mGEcL4zSnReaWCBqeo8/QoqsZtR4szH
        zVAt9xklVjdtYgSpEhZwlZgwdyKYLSLgInFswTRmkCJmgT9MEo/n3mcHSbAJGEr0Hu0DK+IV
        sJPYf6qFFcRmEVCVOHZ3BhuILSoQIdFxfzUbRI2gxI/J98DO4BQIkNh2bzMziM0soCnx4ssk
        FghbXOLY/ZuMELa8xOY1b8EWSwh8Z5OYvvMwK8QPLhJ/OycyQdjCEq+Ob2GHsKUlnq3ayAhh
        V0vs2t4N1dzBKNFyYTszRMJa4vDxi6wQG/gkOg7/BWrmAIrzSnS0CUGUeEjsfbYcGkYzmSS2
        XXvBNoFRdhaSJ2YhOXwWksNnITl8ASPLKkax1ILi3PTUYqMCE73ixNzi0rx0veT83E2M4KSj
        5bGD8cA5n0OMAhyMSjy8DvEsMUKsiWXFlbmHGCU4mJVEeAsKgUK8KYmVValF+fFFpTmpxYcY
        pTlYlMR5H0rPjRYSSE8sSc1OTS1ILYLJMnFwSjUw9h/S59aYMHnZ89NHrayU5VUfnl48nz0n
        6n6zyvQrK32Sz/MwOe449n3a9w2b7rTll5S1q1hltoWuLBZbOeNgmJvfZObTq76+uh6hNaF7
        YbPhrD0XWJ79zQ7ZkVJ+XHDSttwlhusuzWtRvaezRumxfv+umFbhh8XdqTfM9jEuPJQrliXa
        JLnIUImlOCPRUIu5qDgRAHhqvJY2AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42I5/e+xgC4bJ2uMwZ8OGYuNM9azWlz/8pzV
        Yv6Rc6wWffv+M1r0P37NbHH+/AZ2i48991gtZpzfx2Sx9shddoul1y8yWbTuPcJu8e/aRhYH
        Ho8189Ywemxa1cnmcfDdHiaPvi2rGD0+b5ILYI3isklJzcksSy3St0vgynh2+QFzwRehirOz
        vzE1MP7i7WLk5JAQMJHoPP2KsYuRi0NIYCejxO3d31lAEkICDxklbrYXgNjCAq4SE+ZOZASx
        RQRcJI4tmMYM0sAs8IdJ4tiXRlaI7plMEl2XrrKDVLEJGEr0Hu0D6+AVsJPYf6qFFcRmEVCV
        OHZ3BhuILSoQIXH25TqoGkGJH5PvgW3mFAiQ2HZvM9AGDqAN6hJTpuSChJkFxCWO3b/JCGHL
        S2xe85Z5AqPALCTdsxA6ZiHpmIWkYwEjyypGydSC4tz03GKjAqO81HK94sTc4tK8dL3k/NxN
        jMC42XZYq38H4+Ml8YcYBTgYlXh4HeJZYoRYE8uKK3MPMUpwMCuJ8BYUAoV4UxIrq1KL8uOL
        SnNSiw8xSnOwKInz8ucfixQSSE8sSc1OTS1ILYLJMnFwSjUwtjcJ+MaUFezaWvz0ldfSQ/uW
        lQj8Wd6SWO9xbOa+VVP4tYu/mEVNMz6qzXHbwCala9HbeXcvPy1X051x+yj7JKYZEn05ImzG
        cxwXM6t8eNw1+eOuYwvFlq4Vkt93MmjK3S/3JG135ZwtELstcyv4cz9/dcFBO1bjZfWvnql0
        ae88/To7+u6Jm0osxRmJhlrMRcWJACvDzJGXAgAA
X-CMS-MailID: 20181203104422epcas2p39e4af6e6c2dcb73c29d6d34f96449079
X-Msg-Generator: CA
CMS-TYPE: 102P
X-CMS-RootMailID: 20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
        <CGME20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1@eucas1p1.samsung.com>
        <20181129155134.19141-4-k.konieczny@partner.samsung.com>
        <154353492516.88331.1979737561234011163@swboyd.mtv.corp.google.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 11/30/18 00:42, Stephen Boyd wrote:
> Quoting Kamil Konieczny (2018-11-29 07:51:32)
>> Document imem clock bindings for SSS (Security SubSystem) and SlimSSS IPs.
>>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> ---
> 
> Fix the subject of this patch please. It's not arm64: or dts:
> 
>>  .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
>> index 50d5897c9849..4e4352bf5a0b 100644
>> --- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
>> +++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
>> @@ -264,6 +272,21 @@ Example 2: Examples of clock controller nodes are listed below.
>>                        <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
>>         };
>>  
>> +       cmu_imem: clock-controller@11060000 {
>> +               compatible = "samsung,exynos5433-cmu-imem";
>> +               reg = <0x11060000 0x1000>;
>> +               #clock-cells = <1>;
>> +
>> +               clock-names = "oscclk",
> 
> How about just osc? clk seems redundant.

Can we keep this "oscclk" name? This patch just adds missing definition
of one of multiple CMUs in the SoC and for the all other CMUs "oscclk"
name has been adopted for the OSCCLK root oscillator clock. The name is 
exactly as on the diagrams in the datasheet, just in lower case.
To avoid confusion I would prefer to stay with same name as used for the
other CMUs.

>> +                       "aclk_imem_sssx_266",
>> +                       "aclk_imem_266",
>> +                       "aclk_imem_200";
> 
> And what is 'aclk'? Also redundant?

Again the names used here are exactly as in the SoC datasheet. I know we 
could use shorted names for these consumer clocks however at this point 
I would prefer to use same convention as for the other CMUs.

ACLK means AXI bus clock, the IMEM CMU is basically just gates that pass
the clocks further to the SoC peripheral blocks.

>> +               clocks = <&xxti>,
>> +                       <&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
>> +                       <&cmu_top CLK_DIV_ACLK_IMEM_266>,
>> +                       <&cmu_top CLK_DIV_ACLK_IMEM_200>;
>> +       };
>> 
-- 
Regards,
Sylwester
