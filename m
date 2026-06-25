Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7BA1CAA78
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 09:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380330; cv=none; b=WWqdLTbFLQCPnMJjs7TVveO/4DMFYsvu2tiLhqx34UK671YqOZf3Ggt3EUTP0R6KV7QaeL7oJ+6xPgzMdaVTb3QEwDtxg+C9GP2fR/ChPjwrElOiWRdo3fPqPAr8qBBhMANG6afqKTJb+Gg869Vlsz5cY1UEPU1Ys+LfvCglruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380330; c=relaxed/simple;
	bh=+A6m/aIwYk42JS70hoiJqpbi65xRhPR7Kn3tUXs43ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCRzFAD9cvEnTF3COh1tldAI2JT6a/iEJLpnMmhlzDpoVAGFYTPYhIX/3kd9Cnak8KZO+UpFk3mvaLwJo9XjLKuTcMJUQg1Swf9yIQKyvJQdVSz9mJfU3eGBjE1UjqJbV/aieEwG/ToLLQpU+yHyT5hhVZ8gaKHtBCEMXL1vQDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oaz9uoSc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JV5+hM9I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oaz9uoSc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JV5+hM9I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pIYQ1921342
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 09:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2wFIQ+4gIsXTKmSVdPfQPxLOLQaHn+79LEqas5so+s=; b=Oaz9uoScJPsDt5Pg
	WE8MlfbpnopfD94uTh4o131FqXp2pXKGlhmzkZR7kWg4ALZAs2qDnBI/vhATMgjj
	yfDae6QW7l1z/pSUCC5qEDI9LEwnR8/F6t7R4UCbNpN8uWvTpnG8qzv4ixTDoirx
	FNseoBzamnKP2IXCTVsyM9Egbh3UdMuFNgyesNBADkExB1SseYs8WefMMzLakjLY
	uoGg0u1eiEtfNYno6wT8J7oQAGkVQcJCRiLNnwlsyvIeDuueRpml3N0ewQRit3lg
	F0evdPVxtkGm39TkBYQjh4HRhRC2tJ4BgBTrqGbHwN/trZxmlVvvGJpQXgSuS0SC
	iR7k+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqhec9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 09:38:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-920d6f3c2b8so16362385a.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 02:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782380327; x=1782985127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2wFIQ+4gIsXTKmSVdPfQPxLOLQaHn+79LEqas5so+s=;
        b=JV5+hM9IDh3fkBJkoqUrPbsHFPb7SqLKvx1Iywu3V/7AfW82i0ieuBn+8g0EXClJDv
         6SmDc0re8fyy3yIWS6yQext5dDOdaYq88ja9TRx9jTukSvkFYFpAUeVK0C79gLIsoElR
         SwRHt23Iav5rGqBFVPD3qNNgpARb99F4T4WB7zW5+BDpkjg9pkyhETMWsbt79c28jUXK
         rOz6BUj4+WruuNu5VzRZsHDHmI50Yg2GiktmP1tEiZy0mDAe1MCTV+O5VvRED/zftdEy
         JxJ2rf1+oNKD370+yiRYr9MGlQRehsdSY1zDEy7SOU711wltyVanyPu09Exb0ldBWyTP
         iFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380327; x=1782985127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2wFIQ+4gIsXTKmSVdPfQPxLOLQaHn+79LEqas5so+s=;
        b=OM2qCJnTs5aKtLz8Zt1s1CTGhP6UC1iWEJHHMC/HLCOP2lRPdI77tlM0S9FnYUl/Pc
         UWN3t8UzWzLQoQtIiwNCZTKquO1x0MiVHFUwBmD9m5s1S5j3yT3e1NCiHs8jdXCUbrb/
         JRJXF5Ci1HqVr0MxgsLG52BvGMIhkq906Wkoo9ggaIiPi0TgiXH+XC7ynkb1zIeA9dCR
         FiDBhYrHoIeTFE+NJcNaocrgxzlEi6eNLbEGBufAubR+b0J/4S4mfjuokiD2hhK4/vI6
         /NZM5UbhBzV6wJY/w+yh/7oVW4sxA+M+6n6JmNxsgd3fkid14p0OC7Yv+76+cNufsNb8
         T8Fg==
X-Gm-Message-State: AOJu0YyIp59yzaOaZd1cPDSV+VSwC/wv8z9XppEwceOY75dyyqS4Dmff
	z35C9QqlxVOpqnSkkLAYLDPnKJY2y+lLNoixSfYXNLpSYEBCtRUmZtsROdK6Ujl4AyseJFnPshG
	S/8w9nqc8FyXeFxsvAI3EaQyjJsaXIqaAzbUiNM9PuDj+n3610oGJhoX95xL2O0o=
X-Gm-Gg: AfdE7cn/dN6Q59b/KpQIqnzuQR7fJvKCSJluJ4k5Yz3T1laZ41vduEy+1w94DiVQgrL
	wW1zaA6qOWZEsjl1peFnVG31GfRknAfXGv6QbA97+jfuJZxBkWhu1imUzQ+w8CUK++LXAXhIU26
	A1kkH7nW1Pjqh3/vBpScuc2iDw/gIf4d/OsAATkGIvi2+Hcoz+cXkVQ+EvixCqnedNF03uLkpob
	ncfpeK/ebavvRNf7VNLsRFwDm66G82ICRCmNFGbq2AHWUimZiovZlOc7ubmeki+iY+LEnKxMWUp
	icvtFoVJeYu6cIUeE+o/itjlqc4+nlAjxUZzUV9TCjS9xFI6xV6sVV9VSiUE3hutlQkT4vmZc1W
	m7q/s34AhX349PsMOUArj7ncFkHpL69YKIRs=
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr138452885a.5.1782380327240;
        Thu, 25 Jun 2026 02:38:47 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr138448985a.5.1782380326732;
        Thu, 25 Jun 2026 02:38:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05ed6sm139435966b.30.2026.06.25.02.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:38:46 -0700 (PDT)
Message-ID: <ac8712a5-f885-4688-80b8-d4c601a75192@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:38:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: qcom: cbf-8996: add clk_sync_state() call
To: Brian Masney <bmasney@redhat.com>, Saravana Kannan
 <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-4-15f82c64d95c@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-clk-sync-state-v2-4-15f82c64d95c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VYXbKY9s8vPXO5xVZ88iv6IoAifTmQFz
X-Proofpoint-ORIG-GUID: VYXbKY9s8vPXO5xVZ88iv6IoAifTmQFz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MiBTYWx0ZWRfXwRL7bvGbHgZT
 IgQKct4yYCfwl/DjZzoudVCJJiqhHhhSdPKw98dIjA7OMBn4yyanryhwxQjwV8xH/LZ3pMZj+hD
 5/owE/9xZjTg5TAPm2HcPmQ2VVcSGYU=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3cf727 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=MVrWoMMrqcWW97c4n2cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MiBTYWx0ZWRfX/gSo+2NtYTwq
 MrVVLkv/f/0y5sfqsUO4nehG0hCn2mIt1UIQz3u+DUh7kpMN1kDUguDASgO3lLTbxySnVV69+ms
 FlevgVsKbiYCu1v587ztqHcJucFU50VmtAjOMm0Vh7RtqLVsTp6rV78IUmvM2x+/0wOQistFEk0
 250Y7PUXaiMUaF634QJhLNET350edzusuFXU2AvuwGC14sS0XHOxyelBuAFcCtgJ/lSNVB2Ji6X
 4dMDdWqS2BE2BU+HSCs5/P9o0SXYFrHCW8jcglZFshcBsBRvTleF8MQ/5JGsD3vjd2zJBrPMvlS
 nUSmzxPkAcbjadA1qIz+6Zz2MrAdasGlbhug3/MduHCoc0nxGuSI45JwZZatMWoFNN/+/7vhYji
 Q7/2fWQ7ZrvQ8fUQ6/Lb5CY49mpBbFp88ccwc56O3A8bWLYiqWPFfbUehRAzMCJYBudC2w4jtAL
 JeXKh9Z5vRVEoaBfuuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250082

On 6/16/26 11:09 PM, Brian Masney wrote:
> This driver doesn't use qcom_cc_probe() in qcom/common.c, so it
> shouldn't use the newly introduced qcom_cc_sync_state(). Let's go ahead
> and add a driver-specific sync state call.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
