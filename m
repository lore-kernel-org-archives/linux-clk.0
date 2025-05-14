Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AA51F0E47
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257897; cv=none; b=ixeX/EAgCgGqFDApKe4a2z+Ptxy/xzRxhIWqMPA6Cxjdk9Ei7Krh1rL+uD4P/pz62aU65G17cG/xKrtUS0FnmrSy6MhSkRdDV7dydyki41EW8L+Wudj7ea6733ByctUsX03feczgpfHNg/Je12opnuJivK2C6yCSs114uj0R6W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257897; c=relaxed/simple;
	bh=JI3aO0Xne4gz/l4xJjjb0rARPJK5BMCjNKXHpnP5bvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRslkSR+5goiWOXnlXi8GrNQI4oJSwOWhk2VdktKjUqK5IRskwzP0aF9yhFWfNq/MIoQLghF48ShXrjwV/Hr7eM8JGgNvCE8xHg2kvv8rV6M0OX9QC4JctJyFXLO7btHm4nNLNQIA5Sg3YpnzRA80IQy0f73DlVMrgyHpYx32WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgqZVKFE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgqZVKFE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKgBp5009083
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YpCv2M1J8qzljfnb2RwyvX/O
	s/BNN0wmNB7GwTmqRLk=; b=SgqZVKFEDGoHSFKcbbqYyrrbH6u0zscpsZ7JYhVY
	G4Jgz0tQq20f5cST/134JUbiart+X1+6ffJzXEbArECfVZ5pnqZ4Gf8X4roYiq6U
	WAywHby6F1IfqQPnV89Qx/q8/GZvdvs6ovydlRxHHAGrUFyXdPcetH74rKqtOQHM
	e6hbRLo7AIefJlcaEFRZ/CiiKIWWyGrixHeOHZzj0FIImXnCcOMvd1pow3d40feJ
	UbLQ3oddss5gn8rMe46uQs24hJvRCEsg9R2Ysn04En/zn/6yfIUd/mXleLEdh4q8
	iodvB3D/pGWCYWxmtrxqj+3F5Ytw0z4GSF48dl8JdkU8OA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpv4vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:24:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f876bfe0so38616385a.3
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 14:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257894; x=1747862694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpCv2M1J8qzljfnb2RwyvX/Os/BNN0wmNB7GwTmqRLk=;
        b=OVnBa3NRaMw+k05rOS4ciYBUlXeIBeAG3AiFT4pe7bSugKohqKiyTQt3AVdMUa9Vow
         koxb27dkAakSFqUd6yF5QhUSn6kDb/4r5I9wCQvJeZvJOLhhJpMwgHyjmQDrfm9IDQwl
         EF4Bzmqeyhs4FS35KSRnlp+/dF04TNai9YvW5bM75IYpL3uvzyZFM36pR8widqFl2gFM
         Ri7Gsj9iaRPLkVmJpmrAncYXjGq/9grutP3nAUDGCzkp8nrkMQW4nZohqQsJDeoWPWue
         113HE6UarbY10Jk8KL5TiEjLdR0aOtAV8QNdqNSOLV9neaJ4gtZjdTmbvx6WjIqxzY8s
         btuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQtkzln85bak+y7UGJKdTQmiUHt5dmIOfAW6X362bq/XZxQtxaJDCRLxoVQDBxO79k8S3o2RH4NRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxByARq1ROQs0xnBcYU1GSrzK3Pfpo13VcHScIpow37BjMT4A9h
	pb9bzwzlTQ33+ObrXbmMAR+jS4m2kySXQ0EJSQGPQE82U2Yamc2zpQU/9ykqNOeldwgfqvGbex1
	ZP4miuF16j3eOMdXg0rSmEbFgEkBzece2PfNNfz/IPPtKfB/v/r9PdgZnXfM=
X-Gm-Gg: ASbGncvJ07FKYUKTusC0U3PLcf6Kn6yEI+ZRUmZ/R7n0BqEfe4T4tRiNIPm5tmLxltv
	FKrcQVhk7uo1vTERDVk37AwAilR875+1F2hERZqK2iHPS70Q+kesi4cs/z+iVElYDEVr4FXoAxW
	dWXI5pQq43Mui46zB+kzpH2TeWcKwlvgf1FDDatSVO3MDLh6YRiXZ/HAy5ey2oBBUKRAQNC9bPG
	DEfPf0tHb+cs4BpwXdcjGmYimGY8BULM+1KgEBcf4jFM1692Bkx2czOXbgfLKloAGdSu02lRNV8
	8VmixAwJKQ0sif15/7OghHRlImLF4OnD1ZFgccERva0mrrTqHVvXGkvjvcsnc2z8sALccx/12c8
	=
X-Received: by 2002:a05:620a:40cf:b0:7c5:4949:23ea with SMTP id af79cd13be357-7cd28860614mr852301185a.47.1747257894362;
        Wed, 14 May 2025 14:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjymjeWbky+bWc5HrmqLom065mk8ADlHApOiZ5U1I8t7wQBMAnqsg5tbDDJ56iHxHun566yg==
X-Received: by 2002:a05:620a:40cf:b0:7c5:4949:23ea with SMTP id af79cd13be357-7cd28860614mr852296685a.47.1747257893968;
        Wed, 14 May 2025 14:24:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-327ee94cf00sm3404131fa.4.2025.05.14.14.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:24:51 -0700 (PDT)
Date: Thu, 15 May 2025 00:24:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
Message-ID: <s23nv4tgfkqz6ymc7mtyea5ch62jhfqgznhqptkknmauzywis7@t7a7x2a3d6j3>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-6-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-6-571c63297d01@quicinc.com>
X-Proofpoint-GUID: urau_bffJR-mQV0qorC5BXp8t9_jl3w7
X-Proofpoint-ORIG-GUID: urau_bffJR-mQV0qorC5BXp8t9_jl3w7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfXwtZNuJ35Y1Ca
 K1swQ0BYQ1NKnKb6vE3eA78QeuGJVRRYYoCvNupoxSl4vUX7KJYLMt5H24rNwiaKBsUF8A1abJv
 5FD7cpllSJIc7BxEumGnBVjkVpaaZZAib8XLHap5EOqCNyNg1MsXMy91F+PU8XAwBIOPXyAmf5/
 3eYQ/K4VuYcN9IzeQUoVkg/8A6lZ//BR2D33a4aR1fo/1s1gl3uGsajII8dTS+IVF9H9U/O/P2o
 W5sq/s/FnphMm/zFOwiscA4uLt516Yq8bvz4yK4rvxICR7jRSDt/R3zqT0qPzqk9VkfO3+Wt5ut
 kI6hFahkLJXSV/AjxktdzHMdTPRmj6J6TOT9AXZMv7WMbCz3EAhZoDdTR3mE29Glo61lZ3E66WF
 8BCcVhpbOIfk7MZqDqlk1Mh5s49D9q+wLQTLMgOz7U+dKtAjk7rHIcGgAwiEdj4jUZgnhTyc
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=68250a27 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iQDCAvNWiRZ5lwmz5SwA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140198

On Thu, May 15, 2025 at 12:38:51AM +0530, Jagadeesh Kona wrote:
> Add support to configure PLLS and clk registers in qcom_cc_really_probe().
> This ensures all required power domains are enabled and kept ON by runtime
> PM code in qcom_cc_really_probe() before configuring the PLLS or clock
> registers.
> 
> Add support for qcom_cc_driver_data struct to maintain the clock
> controllers PLLs and CBCRs data, and a pointer of it can be stored in
> clock descriptor structure. If any clock controller driver requires to
> program some additional misc register settings, it can register the
> clk_regs_configure() callback in the driver data.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/common.c | 39 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/common.h |  9 +++++++++
>  2 files changed, 48 insertions(+)

Not quite what I expected, but it works and looks good.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
