Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07852F5308
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 11:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353657; cv=none; b=TDWBh66kqofwFjxAQFUjjVQhTE6IgcVC0tNhBSnX8QkjQBHqi/Z7g4Xw5XNvcHXZmD1VZ6xt/bpTMknmMxaY58cUpkph1dslcFx2kvGgO5AsOVHtM8OXIwTL7h9TJgbjWSH1sTQbwb6sJeT4p3NT/89ZrJlNRLbfuC1RD+Q4KLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353657; c=relaxed/simple;
	bh=ZnEfqd8WYbsRBu49JAdPAIcdkTOS76iHfcTHMMFPn+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iYsqNjJL/f+BZAswlshFYw4s6GJ2KHixvradPGlNXwEVX6nQdd3kB+LoFiq3F+cxmAE6mp2TFR6MFSxkOHZAJ7NK3GrUsGfljrHEv/X5G7nFVDkky9Wkq+DYteP4YXU+RCBU7FR0Gji+3JYDFI6puHan/qnoFIfAPBV9CI+vANs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLwdbu4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jiYPr+Yv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLwdbu4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jiYPr+Yv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VvbH808917
	for <linux-clk@vger.kernel.org>; Fri, 2 Jan 2026 11:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZnEfqd8WYbsRBu49JAdPAIcdkTOS76iHfcTHMMFPn+A=; b=jLwdbu4XBf/DqdhX
	MC0l8u6aUv5G31D+rD2hTJ7zLAYHhc5b7FsR2H/pNvqeTx92CL6soO/gybkf8Cel
	CpiSANtcuw7gzTvJ6Rh3WxFOWY5S9xE8jZITPpndfXwyzU+3tLN4JZ67f+y2rAF4
	Yk7Mz+B8N3OMRmCpIhAyNjzB9p6wLoZtst07jlBdTjoKC6oFNqd+qQsjaMbeBr31
	LnHQUyiamRDwQDJRndAyBHV1clqPz9lhxCSIIvtDfvvQ5cq1k9kGJnbH0o/91aLp
	aTRNdTHZYHLJzm+y9JPP8X8cVa7RqomRanoWwsyLTGZw9tLm3VtfIZyzfpmzoP6k
	RKriLw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6am86r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 11:34:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f357ab5757so56289281cf.0
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 03:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767353653; x=1767958453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZnEfqd8WYbsRBu49JAdPAIcdkTOS76iHfcTHMMFPn+A=;
        b=jiYPr+Yv81w9pb6ZVS8XNosZewAlofqvPaJ6mHusM3hRWkt3VJFL1B8lelZ+8P3kDY
         eHXOr42dMs61TvONDYjh8gc0F3nQaXepx7kAQv5Twsq+g5A6oLKc/k/1qp8kj+YkSDtt
         3Q/lh9qqUDMwxlQ5X452GD+jRxFnryIu4fphoNQ4AAGAuAlik/XHpFkeWatMq1Zjmbft
         e6LWfNDWlqWI1IrcPjSsa9vpCePmKKUwBzxIJd9GsyRtFMMuDVzCq2rTTJ58ucftjg86
         hbZJtixQWMDSVPAM4KuDTO0OZ3zgVt/lxejuyTYvrixBozBIg2gzK3YodMk+4aKTgZP4
         oaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767353653; x=1767958453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnEfqd8WYbsRBu49JAdPAIcdkTOS76iHfcTHMMFPn+A=;
        b=CGQrtTNWHUOq9o/iXdfJ2xp59hp6BgiGDSokrJfhNM9VnO1A/AAQR29Hx64iors7M3
         XcIgr8ejhUOX7imNT7EanFAsdgwm2aNJN+es3uA0PHzKbGcchZf8fxMM7mLo/e1NAG3R
         czevJvEJQtVEk4DE892KfcvCGQYlwVRnhYVE04rSjQzaVNQd0coxgAMBU4fgYStVPchj
         T+CsFn4OOV2GL5LSZL4uiTg2eUIVzBL3RALqmRp1ZAKnIzqynSgomCI6Nc3ML1q64K7j
         3SW6oK6NAVtoV4eOmQ2XuQ5O0twWIiwmldyesxM2/jyUe3T74q2/YgynEo6+lf0fWLwv
         DDwg==
X-Forwarded-Encrypted: i=1; AJvYcCWNRpsF4RedZ/HtAkbs//4SFsRvmBW+Qtg+fdtERFVo6smYEHHwTYtzNQp+I5xWn3UX0fUitgiwNS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0NrLprIgn3GvDXurLC1Wff5NlOSnoRYmHN9oAKfG0FtOENGeR
	6T/LqGDYJ4PbJebPIrnyL9SxuB6V64ViRcx4KYtXO9EF4AE4yOrznssnWWE45McU3sz2FNX9u0s
	Ywi//oWYNz3uVBPRF+yIc284ZziBl8FQlVtzvxi5j+7h7zvNZfh5kTCI/jNsh2EA=
X-Gm-Gg: AY/fxX6ebKIEtsUi15tWj4sPSUIgfkwl/6f6dOckqdDPm5wHW8g753XjyuCqdHGrvRC
	qm5CDbzRDmXC7dhXEePAV78cMxXkWmr1ZSe3IMFJE3bCXUAAq/hm4bvj2dR1jJ+Wyj2xUWumMhE
	Duum/aYCdQhzV3SZ5z/t5B328XybUGrNwPr3mx4AOHry27i19E94Rc33fg6UD9xH+zr5wTGN8id
	PeoJApOXmOPadVw7M7jBPbuOjFARDs3u2lv6aDbtOg2ASmy0xDekAOCxAdGuG8Axx4I7m+YZ05M
	OPqUsTNUyPv2EKmYeylS21FX4IeVh/LLL3h+hZcWWMwGnUFENSv4ys26b7L53jQLZjIbz2t+VNN
	CR3l0V6SC1EiWAIjGSofrDjtAcbY4Gjh4zxOqBNvHp6dkiaGKSV+bCbA57X+TR67l+Q==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr432106201cf.6.1767353653064;
        Fri, 02 Jan 2026 03:34:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQcpKMZLQyO21S342Q1ST+russHl3QXOoA+e/hjw4x2uXgifbAQtXq3FQdi//CJyR1kaPJsA==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr432106031cf.6.1767353652663;
        Fri, 02 Jan 2026 03:34:12 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab4f0dsm4573315866b.15.2026.01.02.03.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 03:34:12 -0800 (PST)
Message-ID: <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 12:34:08 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IwifXGUCm5c3Fiz8ArPVgNIM1hZmpDzw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEwMSBTYWx0ZWRfX5IBWe5B2FerZ
 G/cn/sAOSSZ9Ji2T9xrJY7haCm2rn8CeE7wQFiqV5sm1xOSEqzb3wPTMsu+qCwfnjSEmCgCH3Hn
 wHn4CYupQeheyCLdMCb6GnmZ/l9RZNFdgDRqxIhcl1+4ilUos/iKdBWBag1CErCmeWCtrh/bLY0
 gr9afm8cD98NNeGkGCzvfUFuzwbtOUIsO6YSXSjwGLrvvftnW9KXFVTfkuLnoknlNNv+rbgwlSu
 lEZTGxO7uA14QnCwW2CLNfWfHQjCmSNGYmffu5gcehdkGYpu+K4Cda8XJ2vUINx1oBTvcBpKohC
 jdVOpkpU52Z7w88vOqwsiOysBmEGhmahXRx4G4WkLXBSLhLt/HO94DREqiGaO3R/ZBgacuDznHv
 YnT94qs+9abIe56ugM41BV1qJM7AQ51VTSWgFMljrOULR2wXtsFNfJ0BqtqDD3qFMU3O3oV4WWO
 hF3jgA06OVEbAjV7F1Q==
X-Proofpoint-GUID: IwifXGUCm5c3Fiz8ArPVgNIM1hZmpDzw
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=6957ad35 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=B3EyukNvg1VkyB4u8sgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020101

On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of PCIe controllers from suspend.

Isn't turning the GDSCs off what we want though? At least during system
suspend?

Konrad
