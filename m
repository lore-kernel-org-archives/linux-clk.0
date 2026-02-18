Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBB623909C
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 17:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434971; cv=none; b=Z3GN/PilJvk0FcmcL9csXZMG08MYbYp9l40agUYUie6zH/IqQrlbwn0bNG2Cun8gxcJioy5BEY6/zofSowqZhdttu9HDQmugjpAK2Yx1mr7y7o4vwLK1v9n8Rv1IJmmAuZ3PnWDOX8kpFmjDLdTu3q18DLAEOZYTj9/yx1nHyrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434971; c=relaxed/simple;
	bh=aVhkLepetiYC5PiocTxkPeWcBQuctXRFmPqTzWOKqZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/pnlCy1MquraX3IyaX7jQg3iKzyqLCTXDhJojdUXidaUvEPB51ofKlbKyVIGs0E4QJ6DCpV/Jz/hNx0C2tQdYOVVChi7v3Ec3c3RyAo7vThGbUb1z4CXZxQJ4/d71PZsqIB/ll8FK87fc51NYa9RChXBdM07T1azsHBb/EHWxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPKJhuN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+PzXm3P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPKJhuN/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+PzXm3P"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IDVkDV1046431
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 17:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dy8f5ySiJ/BdCVTM2csbla8bHLaSoOzRqkrlexHU9jw=; b=WPKJhuN/rXonK+p8
	YeiURJjlXkz+lHo2zIfEEr0Q/czZHbIHekUPg40mlHSdMEN2KgopXrdBrSHkXqX6
	zv2yTNts9xhdx0A4RkweL7vb4Orap7otLyPxV65BD+rnjPX6NF67rJa7wqnmMm3d
	w0P1fcFo0azQfgar7mSYfo1o03B5DmTYw9BYEL6PFryfjL2WLd1BnhTOA/T3TFWZ
	fl2CxfLMo46PTzrUEEcwUdJOfh/ZnF6ibOfF96pEtWopxAXMEycZbM7GQARLXn3h
	dQV2JXKA7f8VmBTcirXfYHKs5yDuqKI8eoQCTHdLIioCPU8ZPdXZfEAI/A3DvtGv
	pn1+zg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cded00n77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 17:16:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c7a38429so1006407a91.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 09:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771434968; x=1772039768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dy8f5ySiJ/BdCVTM2csbla8bHLaSoOzRqkrlexHU9jw=;
        b=H+PzXm3P8qxDYJSAG1dFrQN+HqCNzfIVGE14lqKdxEmncSAq85RHORQ29St+rrTt+g
         1E3wMORBQQ6JaNkvWDnGoqQaNGu5H0AC4iqmUOYeSccgVvLPKgzhZEOIm5i9CS3qKG6V
         yKCo9RucJJKzgmjarlWzz1zcVbfWsLarHCigzkd7Ft997Y9eKSvYORORNxyCyTcSsfKj
         UlUSPnZAEot+WrMxBgZo2AHsRpWp1Z+zz0j2mAg/G4kurXiSz70d/BnT29bge6GQIP9K
         3Nz8hEJQYo6D5lAAbaLqotA6G/GZVGtoJv8TZrSpzwoochAyvcvPW16c9Gv8UgrDs2OJ
         4HXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434968; x=1772039768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dy8f5ySiJ/BdCVTM2csbla8bHLaSoOzRqkrlexHU9jw=;
        b=DgaHdXOEAQ5nlrPXD3lB0kWxvMz2mYmxtcUL3u/InP60hwkfmfVC3qGgGQRbZtDgX/
         6c048bIp/HUZAtSSJTSv6gLptfk2jhGC6KdmiF2Q+MOo+j9fPOWjECAiWSdmW20sfSwo
         AszLH8sS17aDXe+jPlRFnbN9cEl+KQe3rvdHmMO/mFt3pnom4i8Jpxyceppz4MhqTCRs
         znNwR/ovSHhdBnr5yWcHkXBQKFTPwVNA0UvAR+hUIb6KDx0TFrJkW+EVQSfrU0wZw93U
         mDy+gA7yMHDf6maKe/zkoZBsbaRL21GUSbCgS6Uajcrh2V8X17SQsfD6U+RxfffnRt1/
         kFWg==
X-Forwarded-Encrypted: i=1; AJvYcCW2U2Sp9NXosbABc9bNp+LcfMKQglKO2+E7+3AQIu32jPBhxfzcda8Kzv06WsFt9aWoJS+Ik9Ed/Fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YySJqsfIsbL+ptyb2aeyB0+WJTnt19RGLa8B2jZUlAftBhT7F3n
	/enj48n0vD7aYY8SePjlDYF2a1tRY27N1ooAmAhpMm0kB+qpUqsbxNaymQLyctbdoKj5hlISyLr
	u1I2WKrHl/4S8TeKhWEv4JBE6nBbcDLbwsURjZ5ruVtEHD39SKm/DMSdlf8GOptY=
X-Gm-Gg: AZuq6aLJnlZtQQP7cmIQVQ/5QuMJk4p0KyR6nZ1cT640OqVG7OSb8NxDw28R9Cobcfo
	auk99I3Ie0JoRHqZvoac2iFK1hVKITpnivG5F1E9YWhw0rz4e/azEIXKfUmQX38uzRWp7cBQ2mw
	B0/uyFAbBRvt3JGP0beg4yE1q6DOXEfByG2G/Bv4ih4JTNd7G/DFCXCY8ayvPtfRhOkMaqIAetX
	p7NZZShJN4UqjP2WaqKNp2JndQDzryJSOFBxfRnRNUd2Mq9IBkRoSEtSvT6r+uBVHdfsInxgItq
	W7MIjlU96OyuDginJvHisM59bvl5UrX8sRNrEPP643kk4inLBLVWQqFwoArrzEXIHAHo6gh7lvu
	zh+C1e6cSHdUHK9tVCN4E72eY1AFPb12qDFcdFbaNTTpyQ1cD8Q==
X-Received: by 2002:a17:90b:280c:b0:356:256c:4bf0 with SMTP id 98e67ed59e1d1-35888d3952amr2187694a91.17.1771434967762;
        Wed, 18 Feb 2026 09:16:07 -0800 (PST)
X-Received: by 2002:a17:90b:280c:b0:356:256c:4bf0 with SMTP id 98e67ed59e1d1-35888d3952amr2187640a91.17.1771434967233;
        Wed, 18 Feb 2026 09:16:07 -0800 (PST)
Received: from [192.168.0.195] ([49.204.28.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f6b84dsm32581162a91.10.2026.02.18.09.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 09:16:06 -0800 (PST)
Message-ID: <55dafd36-8b6c-49e1-9579-62e6d97c1692@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 22:46:00 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rpmh: Fix LNBBCLK3 divider for X1E80100
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qTD0RTUaAik1M5qghyXT6_MCRayDI8Wc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0NyBTYWx0ZWRfX4MvVYYggadxg
 kwFcdGnt09ev0eiHlZOK+Nujb3anfSuOgk0Z/HGAGNw7wzgVRBZBVU52sT7cW6BIcdevct9auVq
 s1awDObQWWIYS9fC6xvoEGoJVl71Cchldk2MmDGWZ+zZ7yOjpPPVr2r40ZjK/VOpfsdA4jKYqIm
 W/raOf6lX3AXDOhhCYLDCiCvlDhnuFAHzORmMHW+bKv4/yF+YBLSt2aQpD49xN+i6djFqlHqdUf
 VmaMAumQi2kEEeXRA9HP4tKJAvU2mwL9sg2Qii3g8eIXgx4ASzBUEA7KYp0k+4gvC6w1OuHTujj
 FEbPVRw4FJBcoqTnGFV1sSXxusHenCpopGehLi2bwhAdfhqg9nbvKaXdb9RwXLFq7PNSseKg0gr
 tsoHCBi64rLwAVne3gvrQa5HnFge1L8mP0GrAnC43q1xVd7kAvCmGvXX/uhB4J0CPmp0J6IpzgF
 NGsQiTS29U3aSrgedaQ==
X-Authority-Analysis: v=2.4 cv=b/q/I9Gx c=1 sm=1 tr=0 ts=6995f3d8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IXbkkVN8uJs8XsqYossUiQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=POSefk-TqIfGLmoKSF4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: qTD0RTUaAik1M5qghyXT6_MCRayDI8Wc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180147



On 2/11/2026 11:52 PM, Taniya Das wrote:
> DEFINE_CLK_RPMH_VRM(clk5, _a1, "clka5", 1);
> +DEFINE_CLK_RPMH_VRM(clk8, _a1, "clka8", 1);
>  
>  DEFINE_CLK_RPMH_VRM(clk3, _a2, "clka3", 2);
>  DEFINE_CLK_RPMH_VRM(clk4, _a2, "clka4", 2);
> @@ -840,8 +841,8 @@ static struct clk_hw *x1e80100_rpmh_clocks[] = {
>  	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
>  	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
>  	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a1.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a1_ao.hw,
>  	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2.hw,
>  	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_ao.hw,
>  	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2.hw,

Bjorn, request is to drop picking this change. This fix was identified
as part of downstream validations, but what I realised late was the DTSI
of hamoa upstream and downstream had a difference in the way the
xo_board frequency was defined. Upstream DTSI xo_board freq = 76.8MHz
and downstream DTSI xo_board = 38.4MHz.

The xo_board frequency seems incorrect(upstream) when I mapped it to HW
design and needs a much more involved change in hamoa DTSI as well as
the RPMH clocks.

I will send out a v2 patch later which should take care to fix.

-- 
Thanks,
Taniya Das

