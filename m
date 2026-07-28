Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF96437BE8B
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240735; cv=none; b=iGLSpopER2naoM6JpeTiCapaknTAVcOQuAxJZqhOUFn+XtaL1NYL8otkl54mLT55MNHhAmxZa6LcrkaDzAtsJ1bsVXvnjWu+zARNUE1rIoApR4N+0SP+QkouMvT/4WhHMo084eUXZWsyooxdrsxZZBfX/jLj0lzkN05o1FoiFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240735; c=relaxed/simple;
	bh=JSIr3kaLvf6IsrmhIXeaXtrHX9Qb1OIGUzSMn2IXRBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGzoNNXXBjPKLMJQ/h0/FLwA+69S5QhODbAmjDtokxP6nFpJ3Lic1JqOai01GbNFiJv4sLO55+7kvXEONZs4sMA8jWo5duiVfNtJSjjo1pJ8PUdM/hInHNj3ktwoxeCXZwazeoYwgPSCnZG3iEa4SKz4o/Cj0TQKfMEgHF7X/pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=In17PwVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoMutTeL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="In17PwVI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoMutTeL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBI4a62818728
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 12:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8U2vFerU3ehVWBTa4P6YN4QFzXyd4Wvv5TpYrwzvupI=; b=In17PwVIx4iAkDwX
	AsUkNqYvPff5QYbKs7ZivSz1mMB7j/eYk26cOQUvuKU7AaHvRL/esogjGO3FAmzy
	8VNDaMQj5uKklbzSZL5Bizo9k+BOksEc5gkrSINu1TTaNrnqgUtntlD3iCnltU+B
	8h2Q+GxkQrR4P80Y0y1mw4zUsWX2j6/eACqj8tdbdV/vzzJQFzGBCdGjW+G7zP6T
	UmRYZjUMhCl2Z1JEMDoguqxCRz1PiA+wVQVUSPBQK4ocTBU1OEZWb9yFk/6q/Ymu
	lhy3LV+o9IaumW13mc1XLL91+/y0MgGuZwU6alOvVy6/wqviSH3T1AcJV1bUmtZ+
	2Vr6XA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y1usu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 12:12:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e9d892f0dso12402721cf.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 05:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240732; x=1785845532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8U2vFerU3ehVWBTa4P6YN4QFzXyd4Wvv5TpYrwzvupI=;
        b=aoMutTeLnJ/MBZRqZQ84g2eH5x68AjMYjRlOsC7Rpd/Gtfh1CKFJqH+WwRrlgwjavw
         Ed5KKZegbKweAGV6/w/dbyHQ5gnihgtT4PuwCJTf/TwB2zl3HlYFDUtokdgL87g0v2A7
         bL54BRhuCFO0Fama0YbY5OK3aS1CQz3IkqjwnkZdHpRQ+vKJQSqHLEot0WoPA54Ye14z
         zy3FEwb8sPIegupQzt4WLGqFdSe10GlTrbOJ5grMPdXphk/7mjmqXXKQBvqKJf4YF5O/
         EzrA49DsPLjcqN0hY2aH52iV2Zw4f1o8DfFTc13LLGaqgDMkYmoJCa57YYzogKHki72f
         V+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240732; x=1785845532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8U2vFerU3ehVWBTa4P6YN4QFzXyd4Wvv5TpYrwzvupI=;
        b=ffxjphV/2XLxbxU+TjNTS6bIYYuMnYlSs4yjPEb+y/A/tSJGC5mhBp6N9NSBnzCQcm
         1qJCxYdk7xE73FMbGQES62bL4RudZGvWbBrMD9y9bYkxVCaxj+VdMKOIL8625PsU6kUm
         wDvyRQ8LNwTOtbeQ5yyHblLULcnoXUPHwAHhkjHib0cdTwQWD8Zy2OMChb3TY70fwYIJ
         DNTOj8ualjKCR7rW2teu1WKm8FQLzU91Vw+Ex3k5Kx/hWOX7dDfdA7YrTKIRWq0yedvp
         uLavRbLkcaHdPDrIWFD+YTSWDZQNlMMTnoNG5Dzg6x/kIQMmNz3Fy6LHlLawptD9hjvv
         8shQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9+7jGAREi49ktUpBSfYoEFXHRO1px3Y5UEaOpFc/IThRdka8Re5KR0FV8IxUKztu7RhYhn4t2zdg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyydt4/povXZFXFnCT0hXkrNUh6SV7Q9J5KVRyh3tPSCvdQdRG2
	Bn55bcppgvaiwXHZw1XvLOqZoOZPIGhlBRimIJBCK52nqPkbjkMPP3grcAGz8FZatXl8poTpU/m
	eWX4exGu2hcARHhD95DYQndEsp/0yMIRPMey/hOZmv1iELWCZ8qpjLr6GqTPnEec=
X-Gm-Gg: AR+sD12eMNMBwF1pwYvxXsMthaaz6JBszNb3JHwCe94287KEcy2gvyDcdaYtou0TOkz
	0Pi6n7Ddq/z0KA0qr5p7yhAtk8eQOzLzeGy/Is6sRN6AcbfF8gBCYQaZM2nSvcefjqpabqIVgD4
	ehqb5aFop7gZlT+rVsWLiRuUbWCUUNCdJyElAwHGERLqG9ejVNBtUY0CQY3LEe0UlXOzriEHJ4U
	o5Xz2DZZ2j496quZIbdnE8dljSuL13Dv3HyR+WoP9I9RNFKN+9TNP30UiyB4zAqOG054LvfCAgt
	p+n0NFyNM6D1o8Ro14fJzhfQWAqjcJO6Xn0IliB3X4UdSXZq/ZTO7Bhf+DQFVnr6+HYaB2foxsM
	112PAZjU40oAXEr8swz3N5nTB
X-Received: by 2002:a05:622a:aa04:20b0:51a:8c9b:6492 with SMTP id d75a77b69052e-529d7232ed1mr10656361cf.9.1785240732316;
        Tue, 28 Jul 2026 05:12:12 -0700 (PDT)
X-Received: by 2002:a05:622a:aa04:20b0:51a:8c9b:6492 with SMTP id d75a77b69052e-529d7232ed1mr10656001cf.9.1785240731788;
        Tue, 28 Jul 2026 05:12:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c902d2sm742669366b.34.2026.07.28.05.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:12:11 -0700 (PDT)
Message-ID: <4f4a90d0-6ce1-4d99-9d9e-74678855a717@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 14:12:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
To: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260723110231.1586417-1-sarath.ganapathiraju@oss.qualcomm.com>
 <20260723110231.1586417-3-sarath.ganapathiraju@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723110231.1586417-3-sarath.ganapathiraju@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a689c9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=spIkkW4NbfvDwUr-CFkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwOCBTYWx0ZWRfXwRVjdWyiAmKR
 Eae6zG+Wfiv1gf/TyF3ePKfl45uDRMtrksbKUeZvGx8gmZm/tIt3a9J/9RtbXmtfaWB/9VRSdjx
 +zw9mwNQQQwrrNNGLFuCLMAatNNCjkM=
X-Proofpoint-ORIG-GUID: WQauMD2RMGC_ek3Sh4xkIMHvnM41uHGS
X-Proofpoint-GUID: WQauMD2RMGC_ek3Sh4xkIMHvnM41uHGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwOCBTYWx0ZWRfXwWAB8062zDnP
 i+t/w+FnuPnDFkAxgPzvSRQQaIJyOeyW3Y/i4k/YwbKPwy81270r9pkHPMtaox1zNFEcRHqHGuU
 Xh4xYOtkt9QZMCx4n49v4L1pTyDSkznRiFMMkI5MWOs3TbWOf3S/B2n7PTwthTG8AQ/cMOI18Eu
 k+sgY4ysn2HE5NqjZaXpVhaikq1/utdcyU/XRNXEbw9QnHyB924ZRagzfpiquZPNhpW2Nm/lY8w
 ikRCciGFoxPBW4Dk80G6MKkkTsQDpdDO8VEW6cL0MNUcMTOH9XVWmCDf6DkDBGoeS3fZsGOiDjf
 Ke1cETMlIOVeOEcssGs0O5V2O3kFo726A3ELho1RXg9+Se0gJYJJVOJPQ2MPEYEbKJ+TXJcESkr
 52Y9kuyWpkV2BNIT3hqBtCy95pTSNBIvmoJtYMo+0/x0X0tWKNaZunclZoKyEAKhBL06Bqb3V6o
 Zniiu3RHLS2resD74SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280108

On 7/23/26 1:02 PM, Sarath Ganapathiraju wrote:
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecases and
> can serve as a periodic wakeup source for the DSP.
> 
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the
> other clocks during runtime PM resume and suspend.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |  12 +++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/lpass-va-csr.c | 143 ++++++++++++++++++++++++++++++++
>  sound/soc/codecs/Kconfig        |   1 +

This patch spans 2 subsystems and 2 separate maintainers.. we'll need
Mark's ack for the sound/ change

>  4 files changed, 157 insertions(+)
>  create mode 100644 drivers/clk/qcom/lpass-va-csr.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 63f271aff177..6ebdccfe37e0 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1998,6 +1998,18 @@ config CLK_GFM_LPASS_SM8250
>  	  Support for the Glitch Free Mux (GFM) Low power audio
>            subsystem (LPASS) clocks found on SM8250 SoCs.
>  
> +config QCOM_CLK_LPASS_VA_CSR

VA_CSR is the Control-and-Status-Register space of the VA Macro,
the name of the config should deifnitely focus on the heartbeat
pulse clock generator within it instead

Besides, that address space is huge, yet you're claiming it for
a single simple clock. Exposing anything else from within there
in the future will require bindings updates, which are usually a
tough sell. Is there anything else in there that we need to cover
from HLOS?

Konrad
