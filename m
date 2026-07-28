Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C102740F74E
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230995; cv=none; b=ePKkZL1Dw2sh01Z1TnjOMgYDt81Cm2Gku5DAXuB9oph7pbgZiSUkvl+GcGl7W0BtDt3ZJbTo5BZgNLMzLP9DCRiSW9yoa7DFgKE7v7pNrCOnCXME4p2EbnxgvbvPpH3JbyiI4zS9DyhsQz2cTuWbazZmfeBqhJ+ayV8ukodVLMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230995; c=relaxed/simple;
	bh=+cJ6lA0Ry4sm9jxuVqVS+Spb1104T8rj0lLFUr9YixA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtDEDpAwrTTZnrWX5VkIuJUPBSV4x15cmK5P2C86vieqykCydyckimRqldU7MrmbieaWP1zw39n6ElOPgxcYGYRAKwYxjOd+/8Hl52evdOwcLnTh8ib8Mh/fo2hn9mWdcsN0bAzE+Fjix173+hE2WVf+sRhYIi+AWoOcIuOYOcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bY4mFudN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UC8VbR1C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bY4mFudN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UC8VbR1C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82nA92309805
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GC/ZuBK1RLJ4ibzTXEvYuoddg6a2oCrBqfBM6hC1438=; b=bY4mFudNCbDLmTw7
	nT4W1b1w1tiKDSBRPCjiDIc7tdENyfJx6yQYk0dWIFO+Inbfrm1Wt61QMkt8pZbR
	TpQS9XdL7JGwiPPKAG+Wun1cgssUIZIbGxXtziFw/Ez00ksCRaijwzXxvBI/17Ys
	oIn/PFinPIrulCNeNYtAnHCmCXrgt3+40qPEVgC4ElyWIBHNZ1WaSrtH6Mzx6K9g
	VlIr2NYh0LrAqwG6YZGGrrUuWXjgZzrVdtxs4wxHRtJLmJFUI9v3nvbFSDaBt0mb
	GGdJJTbKezNB8fHxKtnGYQK8q0ayopddOmKZeT/ioGAldiJuxBFCenp1X/dtmfwT
	rmGvVQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7j12a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:29:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe75b7dbso7605351cf.3
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 02:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785230992; x=1785835792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC/ZuBK1RLJ4ibzTXEvYuoddg6a2oCrBqfBM6hC1438=;
        b=UC8VbR1CK8xO2QOfA+1eSoMQ/N2hH449LJ8tvuyib/v89J2/GKhv9pe/BwcNXPeTaR
         ve8qa7dmvBK4k/uUNgZFUdjPpxXEUmh8LTXMaYEjrpSeNBWyRZqqlUl2k4jyQqq1WVoQ
         naXBQUrOho1PJK/hjWs9GFtGLaiya6hw/PRbZBY3e9eY9L188dgO1Lk/UyePitEvlOlL
         gX2MotHzkHxW+9y48vi4qzWuyjX0DhYCW/0vbtHeGI0fdpeUVXgzWvAcMjnjQUfcO/cs
         2vfV8r0IBo7SKjktZWqWbge093uTGEQjozY+eMo6Wjdz0jqr4gXDTzcF2VKVMKb1NidO
         1cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230992; x=1785835792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC/ZuBK1RLJ4ibzTXEvYuoddg6a2oCrBqfBM6hC1438=;
        b=jLgC+IDgCCobmQ0INJ6EIKqQ+Kn33fLHbX2GL/WUmkDRnw3hZqN5Y2BxgkQbqLZSkl
         pVFbBch2vwGGh4rVi3ViAGy2eWzkGkq/7fqVSPPJxOMEDVbutOKmsLH0EpvYvFt49TH8
         XFVvuZBwhCxZIXNZrRswC1fqkW0izHs27jOr252TDnmg63HSS1VnuHTnyfxND9KkXAGa
         /VwnArGSOzGQX7WzUsA4L0tPYDdo9E/jIog8e0fTck5zgyfhL0LN0atz5eEa2/s+fmwt
         XSSaQta4B1lrtohWeooYw/HYRAik6hCK5L9lXg7cmuYDENuq/xFi63pzRCdin7osA1fc
         OU/w==
X-Forwarded-Encrypted: i=1; AHgh+Ro5mSYnCsDKhJJfUvGkNtO2GrTdwDPeToJgcspbn8LXeO9vmvrUWTq5WiGF+I6HO3HzijZtMRRjnbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSr1+9IDwV3yj9y8YqOzvpjAdTyMHjbnHxluqVfmcSMSLkClux
	FCshaLIx7SYDHk6ptDGv+Y6sWIBO3Jw12SX/VZ2AedzUL5/Q6fbGU8pxgXFe6TOdQufGXypIRAw
	idsfOpwq2C0xpT+Na4ZSMDqtGFmW0QWqhBX7qLXcC+Tp+iq2X5XNmY9ovLeXsMgQ=
X-Gm-Gg: AR+sD11lU7dshkVaMgYuFtBpnMvIdfB0BpcJmz/OIjxvv2PPVSw8IL4bVHnHtxso7UP
	mUeB/H7RQghWzdbBHQYsVjmCoToQLGrchJfn5vVGTKuEAt/WH4YL4TCDjoiydFdRNNvwe9NdTPd
	gBpkHA4sYihX1ZUsWb+v/g7he7PtEviQFmWBCg22t3FPgKxgyqD6y+84irxmlapOixPK2NVTCSM
	BipJfqVmk9dlzavrd6sgCvdfPynEOvfBr4FVRVTnGH0Idp1vyZH7ISzV+8+qe+fRLi0spOdcWtO
	WzDKcbZioPVSK1kx2eLO3BMwvKS69ba+fB99n2VmyZ2UrWHyS9InW15xKvxcplwIen9GqbmZmf+
	Bq+krAL4Ji8wRVDssUsFRzTjW
X-Received: by 2002:a05:622a:15d5:b0:51b:ff78:f229 with SMTP id d75a77b69052e-529d6feaeabmr10813711cf.5.1785230991933;
        Tue, 28 Jul 2026 02:29:51 -0700 (PDT)
X-Received: by 2002:a05:622a:15d5:b0:51b:ff78:f229 with SMTP id d75a77b69052e-529d6feaeabmr10813591cf.5.1785230991598;
        Tue, 28 Jul 2026 02:29:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm3675170a12.15.2026.07.28.02.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:29:50 -0700 (PDT)
Message-ID: <a907cba4-c276-4355-986c-44f6e39c310a@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:29:47 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX+XhQT1XX2+yL
 k1S+F2Pi1wMGhtv8T59lnovFMa0PSgmfFHHLKhlAw8t38LC9MHQFDAyD4Vie6Cih/YucsbQ72/J
 sRhNUkO+hph4UKtnLIRyfLP79wJhQ0jWagauAwGgnhFz2lmTCHxRfWNGZsn7T3ngSKp+nFXkOgD
 na20H7YkN+0BNlV4Y0AFzETqrEVh/Z6641rbBvgimcW4cjYEK89xLaRt6hStptOihn+5O1krY2p
 x/HSqk4jkIgWct6XgUHt0dHunDwC+wCxXN7ciJ6W/J2epTdDNR2zG7wRxtEWqw6rTWJymLMU2Ur
 12EHryJO/E2koORN5EglJjYIzj/l8Uk/dCIzAKmq2vQ+W54o5gBYl028lq5yvpGm7ra+lpaCbKW
 7LOEWLhbDBKVfqemovNbVSire3Ba1vc93saAV5m5kEusFOPlqyp2bMqhkSVSYpNo6LWK6ghAOK7
 2hTXRAGZZxTMXcKXmuA==
X-Proofpoint-ORIG-GUID: 1Ruwul79lLY6vRLkltYpr7WDRkc8rKFE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX5d9ag345xSiT
 j2NBxfjZ3Mo4V3IxRa5fXnx/gPJdDNM4PKVEkw4AIJhlusk4V6xQdWjTa3ZzVcwX+O5M92+PfeB
 2NmFVNrg3fDV89gkgjzlVWFmMPYhs1Y=
X-Proofpoint-GUID: 1Ruwul79lLY6vRLkltYpr7WDRkc8rKFE
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a687690 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rcriG_6vuXrZ4KVOdM0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On 7/24/26 5:00 PM, Luo Jie wrote:
> The NSS (network subsystem) clock is derived from the CMN PLL output
> divided by 2 and then further divided by a configurable 6-bit divider
> with a valid range of 8-63.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

This looks very similar to clk-regmap-divider.c (or at least to
the generic clk-divider.c implementation).

[...]

>  	/* Register the fixed rate output clocks. */
>  	for (i = 0; i < num_clks; i++) {
> -		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
> +		if (fixed_clk[i].rate) {
> +			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
> +
> +			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
> +									 fixed_clk[i].name,
> +									 &pdata, 0,
> +									 fixed_clk[i].rate);
> +		} else if (!strcmp(fixed_clk[i].name, "nss")) {
> +			hw = ipq_cmn_pll_nss_register(pdev, cmn_pll->regmap,
> +						      cmn_pll_hw);

Huge "no", this must be a compile-time constant and not rely on
some funky detection.

Konrad
