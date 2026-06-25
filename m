Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5B337472F
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380659; cv=none; b=Y1QsKiuxOeVscVHl/7UcYrgsvJ7UkJ3JVHlUX/ySNeKSuFevHyu5J2iaj/fEFOBwtAT3SBfbuqXT8CDZQjUuOtzgA2EOIvcrbC+e7T6KENpoSQVnNLiTmecQKl93c1B4qhuuxngDjiYrO9mY6De+rFwFQ/QJdjO5Q5QyQFRpDRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380659; c=relaxed/simple;
	bh=6g+jRBdLPCtmrXSl+ZeBezUOvp3mrscy01YbJDgZj/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=novnlFowgj5pzsUc4E9QKJYs3+RvsmbiP+qou2jpuggzkn1BunobqdUjv5Ye6DNCFWvb3u7y5pG60oTMi38ObkQh9QS4KKuT20CfDFZfYsjuViyYlea3FRYconsdLJo1ZTF6mHm0M2oQ6xk8ld4I5/H03tSz0QLwCb2nKIGovvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACBWIlfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V72QxshA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACBWIlfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V72QxshA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pWMg1795818
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 09:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3w3x8F7EpJJvDzUCzufd3NipAnTez81YBJ5Ga8zCtYk=; b=ACBWIlfyclT851X2
	ad24kPSmXxNIFqG0/DMzCQYW4/ynNdGhe8ChvxewOLMFZDENUmVq4Bsd9ccqmbRc
	EO1CSOfG83qOojLSnHJMszQGjVXNWAnif6Dx3msml3oINVUgG6MWZFjnEOkj8ytx
	/WHAXPOlqlz0DNBdLJYOsWnbE9rpWOPyDe4+vxLL4rG86nrwC1DN2nJl3D0ObBSX
	7gDJkUzRa6x0Qca1y8FVkwIiB4MNjDI+zNlcVU/kJtGSkprwLW5raFgVJdnt4d1q
	mn4NTaF3i1Pws8nerwR7nmPglx8XNJEfp8GC/R3GlJFs5vOd5HuwU77ot1gWRStg
	qhUVCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9jwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 09:44:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915756c1407so26959785a.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782380656; x=1782985456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3w3x8F7EpJJvDzUCzufd3NipAnTez81YBJ5Ga8zCtYk=;
        b=V72QxshAWg3aT7ZefD+2FjIS5rOmKh4STJ3MccOon3fmVVSErXed1/3lnpZf8mqlQd
         W/lR6RFrk0w7dH6PBzZE8FbtJt7OL9Hfzf1a6ihdV0HUI5f9P4TtF1Q1FlXLCIMt+Hln
         vaKx0NLzPrxxHX9yFAW/zwXvf1e1wJeJwbLBE0fCHvbdo3QA1yRta9HseHg4zNlHfpkM
         3/ilJ0lFTpFUQmseJLl+Il9vZSx/CwbIiX13XMoINbggeYkv8F0ZC/DQEtLptlpq11K5
         bIMEeIEL5O+LvqoEbHZ7xB/0OzGABdcw0uQa6HSQqwHN1K5i0NLdZyDhN6IxgHhnWRCf
         iT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380656; x=1782985456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3w3x8F7EpJJvDzUCzufd3NipAnTez81YBJ5Ga8zCtYk=;
        b=r+J8d58oKygYDCXeWuDgS+UnDpMamdqFnVzVK4el80YTBMutP7GFey3TEzhVDTIcWd
         l5+28QgAF+SaypNuvoabFByqSJBM4fRD/OjRXnfwZAJ+F/4A07A8pNgjDdyJfAdJcB/Q
         F2zXg13Y6zko6v5sc2Lvojm/dafcIou3Pzoy1lpKdduoe0JYNgcX4k5H2NdgqneFD2u6
         GY5XZC3Xew+H1mSit+KbWvsjYlGi/0PjMx8gvApvkpjvyk+Qo3i15Scc5pJ7cYjQc86I
         LgupV0nzlaSVOiX6NLcdU6QFyTxwO+8x4L03HC+UWaYEkTI8o/5qZdvLuXkNazcgKX8h
         UBrw==
X-Gm-Message-State: AOJu0YxvWrqIRuwTuWvH7PtNZXebXLlnVSKM1IBma6n/e4V4ty0V93Fq
	9Xh5Xd+ptJWwUH7r8x/sanop0wKZ9Ri4qnvHCs1IdoP64KNmHt8hYnLYeLjpc7sdMr5csoVe4aQ
	IzwtsRt/8gIrfrE0TiYUNVJWFG48j9UwzRBrhhPwayvmrM+F0hDYAylHIlBnGlzk=
X-Gm-Gg: AfdE7cnrVKBEFJno7Sa5Ju06sLrgpq0hYzW9l6rLX2Ez9nJ09/cK+Ci01lBEvpTtuxI
	hhkgwPzR7G0QVXgileYdgvUODMpFh5l2HKde5FvwHZcNdd/CGj74U+UUOFjt7Sy2aC7gSz7Oy0f
	DWE3CcSWEpoCQBCW23hCg9GaWCRLIyJu7Bh7E6tyqNfS4PXtfVni1nqYj8L4ink+7Y/dBqocxOJ
	zP5EvDHaBMEteco06q4yHUAl+3amhtewDTYJ2EFj+2r9k+A3N0xIuCoStbwPpnDBlA0s9pqu/39
	kmv/FCR/dgvx1sPa+zKLkCtaIbs28whOxbVnnLMqP3oHFkcQ9f3HiyNvg4hGtzZ51MfTxiFi3MM
	VneuaLl3qJ9WIlGTt7Kk5cUc5pZxKaMv4Oqw=
X-Received: by 2002:a05:622a:181c:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a725f43c5mr14041151cf.0.1782380656101;
        Thu, 25 Jun 2026 02:44:16 -0700 (PDT)
X-Received: by 2002:a05:622a:181c:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a725f43c5mr14040911cf.0.1782380655656;
        Thu, 25 Jun 2026 02:44:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba8b61sm140319966b.4.2026.06.25.02.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:44:14 -0700 (PDT)
Message-ID: <21bbffb7-ce99-4c38-a5cc-6a3f3c7f48eb@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:44:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: qcom: common: introduce qcom_cc_sync_state()
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
        linux-arm-msm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IKecwNv_19GoY8rJTKME7vhWV7P-H7xl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MyBTYWx0ZWRfX2qe/HbcgKaGj
 AwAT2zsb/ynuAGqTGa2Xo6fc2h6iSkon7zKzsaRbuYe4ZDn3nukX450hIvk6iiqnih5qx9xC3RB
 XQTvavzdk/ocfJXHuLTyNWvjz79tF70=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MyBTYWx0ZWRfX9XAJRhZ5CcUv
 F7zPudBj41Qq9/Rv5sd6nxDSEuiYexN4KJ+MIDb9mPjm1tGXsei+YfzHqJfOWKB04Q90j72b45M
 D0TwS58ObPQqZoJAqLlDoX/Xrxf4Jgiuzv0zGogcQCTsuTKgW0qe3Syi2yyyo+qyjS4J+9YOfpb
 wbcdBNLptAe9JShSa/3CDD3w7pTkdRdTbG1/mljrBZ/KoJmcE8vSUzVS2N/zfUl1abFoOxMkWD1
 kDzFI/5k9a+VAgjXtkqtgSCsCdL3MOzQf/15g9TjW5bUFL3rj9B+SpDFSAHUWwsuIOQtTteTpEA
 7YCZkKrJaQ4XZG2FyErms2+hNrj0tK9mUQdryZvC+Q4YhdVxNP0nBQzOzrR4FYx+7mvTyMfuwJQ
 oST3k77g6xsoyBt3fmWrB0lGYkmjtO8YsFlRtvUYsbGwq/JFAkSb8PG6bo7hi5aeCnpAUtohl98
 YfdMJ3B3PprcA94NL3g==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3cf870 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gxl3bz0cAAAA:8 a=20KFwNOVAAAA:8 a=MT1a_CUJkpGwGtyQXNIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: IKecwNv_19GoY8rJTKME7vhWV7P-H7xl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250083

On 6/16/26 11:09 PM, Brian Masney wrote:
> Several qcom clk providers currently have a sync_state helper set to
> icc_sync_state(). With an upcoming change to the clk framework, if
> sync_state is not defined for the device, then the clk framework sets it
> to clk_sync_state().
> 
> Clk providers that require their own sync_state will need to call the
> framework level clk_sync_state(). Let's introduce a new common helper
> qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/qcom/common.c | 9 +++++++++
>  drivers/clk/qcom/common.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index eec369d2173b..31382c49c948 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -3,12 +3,14 @@
>   * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk-provider.h>
>  #include <linux/interconnect-clk.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset-controller.h>
>  #include <linux/of.h>
> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>  
> +void qcom_cc_sync_state(struct device *dev)
> +{
> +	icc_sync_state(dev);

As mentioned before, we really need to test for (qcom_cc_desc)->icc_hws
here

If icc_sync_state() is called without an interconnect provider
being registered, the framework state gets messed up:

--- drivers/interconnect/core.c
void icc_sync_state(struct device *dev)
{
	struct icc_provider *p;
	struct icc_node *n;
	static int count; // function-static variable

	count++; // called for every clock controller in this revision

	if (count < providers_count) // kaboom
		return;

	// actual sync_state never happens anymore

Presumably one would pass this through drvdata, but be careful as
some drivers use it for other purposes today

Konrad
