Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481855;
	b=LfJLxuo2BPsQvvyfE23amDADWaHDV4QIL0V0b5q+thXkrBOWsYiSHwuIRoZF2MmQeK7c
	 Tr9zC1lnRefT9wPmDSNbqC1ZTgx684Dw3Qs1lAoqUteQ3LoQylwkJccS3M+VrzLs5yDDU
	 UfIm7s2S/KJ9YeNzQ5cTxE+vKjnIRC0Nybxe7tbaKV3YkGV+RabMxtniX+Sv3GmgwcexG
	 4aXHUr69yDhmyZQnkQHNvYIF2h1DLvFhepbU0dfdmF+pWjppRUuMl0W3gX0AmVG32BlpE
	 gwS2EYJHLZHhMaj4Xqjmcbek3+b0CbOzNpk0bhgaemBpW7zPSpXpcDlzzNtxM7PiIug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mKtABXtxP4HWg3m2oaMjBY+ADs0tjjzCm8Ghlcjiz9w=;
	b=untOXvpoSdXw0PJvQa8hjUae6hrcBQvhrMEsBmV0q55rpXEkWGh5QUTam7LCM0A9QUBL
	 usH1nzhjCA18PQWO2nVK73Qj4nirfB8M75F/3XEvuGs3azhdmQlsInUXxOvQZl2g+EwIM
	 tszvxldujOfmXREgY2JaHi6ykBvvgfetn49CmX1l8s8hDTZ77y4nx15CKZRHRXo63Dk29
	 mkeFNnhv63iTnCRXfRMLrx2MHylHlCAvo3kHSkLDyry2JCW5mWJnrH0N7MDzWfApA+JdA
	 QhDDHjp1r8kIMXq7brB11UeEIcdxuZXFx+Z0BKyjenaatjD6NDCAet7q8uTwk41vFCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eJRNfBig;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QuCjajyE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED29606A31D
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED29606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eJRNfBig;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QuCjajyE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K7ZtdY1001376
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKtABXtxP4HWg3m2oaMjBY+ADs0tjjzCm8Ghlcjiz9w=; b=eJRNfBigwgWLLhow
	6Iu58sECqJOnk9BgRoZ6Uog8Bsspa/DeTvKYWjX0UO1wXHDHKwHVxsLpvr3V6GfH
	iJt1LbcdCfd+kxR1JVk/lm3vGruIj+0D7V+tdZNO3b1n7Ah/Ji25C6rv/Y9E22qt
	qlgPQVEDn02lldWwTt10i2nU5jNnQxhB7YU0QkOxVXwu3ektPr4K+bssf3BELn9x
	hFwLgxpzJHwOs90BJRyJXHJ+y1Hpuh+CCa0w331ZT+pv81T8KL313EzRqFkbJBEu
	IrOyxKutnSXecH0bl1igLVFL6ef9OfzmO9Ngq1KSYsP58qz2/EAzpPgPsuOq4NfL
	i5DC+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1ebv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:37:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so49574085a.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 00:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481853; x=1793086653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKtABXtxP4HWg3m2oaMjBY+ADs0tjjzCm8Ghlcjiz9w=;
        b=QuCjajyEl8v3G/F5hwU67ohTAujuav54lzet79APrwj5IXqyOKwp50pgHkKAhvkJ0p
         kxx+z/pSQ7vldd4103dd6T8ImB1BOoCZ/54bHQLYtAjy30NvHplLnV/ySxGK2vCBiaQf
         yA/AMKzO3tEAKfw93XS+9uaNZ8NmGoi5pgSA/+BzkhD23ZwIv6DEkYryRUPsfYAabFHm
         Lst8DKk58CzUFQKYxTTQ96OjGPJyZYDuMEKQr+kgg8gMQDjLq6snyJRb9aGoCwD0J8N7
         bGmZl4NuvbTLTyAmahUh7XY+qF1GvQ0rY71yGh6KZt4Jh6iTfveJhpUt7A2eu+0L6MFh
         x3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481853; x=1793086653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mKtABXtxP4HWg3m2oaMjBY+ADs0tjjzCm8Ghlcjiz9w=;
        b=nPZ2pynlmzSGLgG//+ZvB3ljOpXucfAgF6D8MU8/8x+F0TjUVXlnZKGbeR1uHMeQ2m
         1Q/sl25khPn5X2Bw+HgVrU2MUVNMwwAS81cCrn34BVRkHPefcOXmFSlD9DKfSFOgLxdY
         MkaZN81uRqnxp+QVgFV5TN+xN8/D2LvTtIyUXB2SmDqUUyPa6avxDIGdXzMpry8chqlF
         EwJo8i99rHMuTiDOGrJ9EcGStJC2aHaToXqyNtodc6T2FFun/rdNT1ksdWf92614U2kL
         RUJj+s3yphkRToM+CC88vhv+N4ZHaUlH+yDztMVS0EhMqGb743Iz8bpCoQe/Ff7AENb2
         2QPw==
X-Gm-Message-State: AFq9FYJK+Cs9a+AnxUPRw+qpO4yLCkxb6D97b90dGccslGBbFHOZqufW
	cQgAEH/TBlgkye++fwVnu50luqlqUEjfibJuqwbp32uyc5gKytPchTYUxIcAjVjVoqBRJixbphn
	EpEQxvexdzC4WKfHUneV6Cu1itfrhRetSuT/9oRn9GoH5RxKBCAZPZqxfeTqhUjw=
X-Gm-Gg: AYBFou1yRRKUyEEJplMKx155TgpcfiE/0vf26lOOmxCFf8RcsRFKkibtGL90sFiPd1S
	xGvXgukML7Kq+UdhHAfpyJajt6K/GE6Aiq5OhIrlGP0C3PcEyv1mczvhnarDFuR8aBacFhOBVt5
	EenkSp/joQ/LZAM/QFqLKxN0714VNolxEgKTvtszV7/SIR4NhmUl7K5o+TQjfORBVhwkFp+LJTV
	EflVCShzP35Zp+n8Qt7Ac7WpiRwyAbK8bWDEwPKiCLCP0omE7qTWwa8KsiBQIHNH9CMMGNY4lP5
	QbOonw8WZKV27MzCfnsitw85yGAGH0CdTCYooXXiekCmH2H0JIA2rmXA+4z4GOSNa2SGdRWd/gv
	BuBQmrj0gDvo7OlnIwN3nig==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2016479085a.3.1792481852722;
        Tue, 20 Oct 2026 00:37:32 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2016476785a.3.1792481852246;
        Tue, 20 Oct 2026 00:37:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091fade41sm450043966b.82.2026.10.20.00.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:37:31 -0700 (PDT)
Message-ID: <101257b5-7e43-4cc1-ba17-1507dad27b52@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:37:29 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression v3] SM8750: cambistmclkcc + camcc together hard-reset
 the SoC on display blank
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
References: <179179331695.677917.11557670447411700010@mail.ustc.edu.cn>
 <179185039667.309517.8503800087166757122@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179185039667.309517.8503800087166757122@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9Q7W0yITUAeSZM5xmzK0BASgpW8ekokj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX+O4Qn+8Ub0yA
 Kj0HOlI+Kd+qycideVKyBTP83V3rsRl/IhjZgieZefW8yF8VDX5rFl5A5MJknNO+6Q/47mC3bad
 8alJMjd/IiX9TaiBswzUTV0yIS6a4wU=
X-Proofpoint-ORIG-GUID: 9Q7W0yITUAeSZM5xmzK0BASgpW8ekokj
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad71a3d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=0GgPJE58b56IY-fw_GwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX/cQw1G/l+ovR
 AVh7nQfeNpZsfp6ebsYjdWrxzpB65zVBA60Abvh4emQVP9ghffYGrB5dsZrMZLRM5esg0kI45xN
 WUL5NBMq8tAxRAAlPBUrs6HKLLfZSrYFWrN9t6f/9ownjApQGHV0T72BF/J4Y81EH/uWk5tZI62
 YSQbPjwXv63Zww73MzAyiK0L5KW1/pux6wqLiMwkXhTcgb1SC2SexeaC4mlzQpEfnLUG4z0ve6a
 zyzIaUeakF5KiBd5VjJmMcqf5k5eNAJHlc7tLY8j2l7L1C+g1UchY2QDCAVSpuzouNmSNpLAJRf
 8dezrPsy3p2NmdJS+XiCcL0ty/lqNrj7tjFH9V2/OYa+stdkJNa0BXbNuN6MLjrOLJ0JF78OCKl
 QkW5x7iG3gxXSLVBg/KMHIIjydQjx7Zn4t1FZDfdfL4I/XxG6m5aLIH3+89nlJO9hrsD1UVTNim
 qbkIf93Y1FM5hvK5OZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

On 10/13/26 2:13 AM, Qianhui Xu wrote:
> Hi,
> 
> Two upstream data points that look relevant to question 1 (cambistmclkcc used as
> a bare clock controller with no consumer).  Short, no new bug, just context:
> 
> 1. The Kaanapali camera DT overlay (PATCH v21 14/14) uses cambistmclkcc as a
>    camera MCLK provider:
> 
>      clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
> 
>    So upstream does have a consumer for the block.  On our SM8750 board the
>    reset happens when cambistmclkcc and camcc are both probed with no camera
>    consumer attached and the display is blanked.  Is a consumer (or the camcc
>    side being powered) expected to hold the block in a different state, or is a
>    bare, consumer-less controller meant to be safe?
> 
> 2. The v7.4 clock pull contains "sm8750-gcc: Add CX power domain",
>    "gcc-sm8750: Tie the CX power domain to controller" and "dispcc-sm8750: use
>    common probe handling for always-on clocks".  Our failure always ends at a
>    display power transition and the last RPMh write before the reset is a
>    cx/mmcx level vote, so this looks like the same area.  We are rebasing onto
>    that work now and will re-run the pairing case (camcc + cambistmclkcc, real
>    display blank) with the same three-state instrumentation; if the CX domain
>    tie changes the outcome we will report back with the evidence.

Try this diff to pin all rails to the max state for a test:

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 4d9463b4d5df..eb410587e286 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1274,7 +1274,7 @@ static struct platform_driver rpmhpd_driver = {
                .name = "qcom-rpmhpd",
                .of_match_table = rpmhpd_match_table,
                .suppress_bind_attrs = true,
-               .sync_state = rpmhpd_sync_state,
+               //.sync_state = rpmhpd_sync_state,
        },
        .probe = rpmhpd_probe,
 };


Konrad 
