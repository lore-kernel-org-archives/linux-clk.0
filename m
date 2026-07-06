Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294D435AB3
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342068; cv=none; b=e5Xbx/PIeFx8XD3VvWJLmNTQ4sFcZwTfhb7RBEk+5wPNSIx0dtEKDqAGXcNnbvswT/zGHz4AkpOBkrlEbGXSu4X1wMPAJoQzz+sCwzfDU7vWkGaaz0PCILg4GIT/QsCT6n1MaWEjRXTueZFqUXgmie0WDWFyeo+3/8n4gefjBiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342068; c=relaxed/simple;
	bh=g5qJX4JNhZI0DmdycjroFtWKDRd43g5/AYwv9oxJ7n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pF2PrhqYZkq9kzPO9tcIzMMuJpfb0gO3KsINExaFCDAvbZwsfzSgb6snL/ITbpUvllQ2KYCRdct/htPLLn9TGeQuBj+f8/vAhydueThSdQbOPQdKHhmzpfmlCfHam2xV0PpkVU4Bh0SvnBBVqu8MzvejZhHqDbvUPYEFToLx4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gj3meI7C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdXiIOxb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gj3meI7C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdXiIOxb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxYXk238981
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 12:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vc9IKcO6PVsTBKODmX8h5MGQwlBH71smxCZ6u3DmRtU=; b=gj3meI7CUFmhcY9d
	VMkA39A5BOqrTPZsaEHVCSuV9K8ovqGknxgYPlmWb4ntP6T6r02rpI8Z/ngeHAnE
	gEpmeFyEBwya+qsLLQiILM9Oz6ssZae/Qlg+iUK0PJhnt+DdLgrF8eKqLwBIMCLj
	oiZtKrdFJsywQgPv9N8LyvO/ot1DoARK61f3hRfirxmv1wgOcCR3CnNbyxVmiHWk
	6HrJpwjpp7pkBnG++9HHJmioryZSpyb+zK+lryLiKcYyQp3CD1i6RAcrIdZgZ3Y8
	szZJaQ635plv1551L9tiuAC0EgMqhamKcwwlQIgA+1R0WFRISyjAUbRYTFu+qX/l
	vytjpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t890d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 12:47:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1fc94a11so3218431cf.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342065; x=1783946865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vc9IKcO6PVsTBKODmX8h5MGQwlBH71smxCZ6u3DmRtU=;
        b=fdXiIOxbfrIyfWWY+xBpi3ztbJ3UNpP0V2ARASTk13+ZbtrsQP8MMHFRgSjXv6Z+1Y
         3N3r90zz1a6Zmvd3fwMyFCNy/iQGVjUW8DDkRrU6CiCo8FA8KA/ZCjgOAdfTt3BfgC4m
         lt8LFQjLm+nn5DitH0BwcUR4SG6L5PVWCBdX+xrEspjX33uo5zqPytbKINYzRG3aOxhp
         io3YHhq/itUDUwuRlXmBQHQal+n17ZJs+LqCH7IqXps1gCKPSaGrWN4U4lGCWNH+Pi5m
         er2VDOxlg+n78Ly75GXKnQbTsge5nSs1TH8kQyZEP4HU4ibvMaaNeQ3xl5A0x/JwYu4A
         p9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342065; x=1783946865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vc9IKcO6PVsTBKODmX8h5MGQwlBH71smxCZ6u3DmRtU=;
        b=r3NtExvQmGeVflkLfTgYlil+0MTOwFyfpfInt5EgKjU21MP6dgKRP+2OKIe8qT7aAR
         WlWxiUkG4gA5cS44Tp0cPw3BQOT1TO70+pgRK12zPDLpqncXTVyFO1zMmliC+9bdJnwX
         hmedXdvrwC4LT39aKAhskQBvtW8I+z2dvtr/GfDnW0Zl2Yv4rsheyjUatLnfAQagKr+R
         s2KB2w0RofhDy56KVDYhUvjKat4CpxnEsv69UDmxPeDgX6thiTuj1a0Sl+pbR/t1Fanx
         JIbEZMREZ/I0ZSB2FV4Z5v2aikoYMpsa5qjuj5BfmQ9ST/5gSmYH2RgB6DFfR3BC1c6E
         DNBg==
X-Forwarded-Encrypted: i=1; AHgh+RoAx7WIORRSQGVoNt3q7oPoj0HyI17iGiRKHXNbzIkNvzupFwMQoJ94PdZbtTnnZPibmbXnpyj/VXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoEa5sw4MpLq80cp10fcHMVLtKzk5cRxLHHX/pugf1M4alMifU
	1CZ95/2gNk+glcrOydWvPDNEBL2WfalxOQ1DhHV4/yr3AwEDDjwjNQx0BK94I0kMpisQlIwFoKt
	VfIGntPtOhBnifr4zuL6gcLB3h0+rIgprirtxnTGAHqzEV2k4ZLI/fY6IQwvflQE=
X-Gm-Gg: AfdE7cn88C8+vDryBlZ40CCEvMbjDgEh4AnWh/AWEUtwLFsx7gL+5mvuyOKyl5x4Afp
	ovbtxaz5O05/gHrquQUMTgmTOoF2iB83ilm60IZTlXz5hsH+lqKIGMzatC1rxD77xLTO+S9BqHp
	SH41NviakK5JHOPUfpx+FQ8gQXi64guZKWaD6NIbVdAJsprqKrxz7QPAZW15hC73WENN6L1v/ET
	gt5py64TO+4tdvgt6XWpF1tzPb3qmbcFI1rs2Ivwag/8Cg286ekhNt9nSg6UveGphnmP1eSt1/w
	je/v8MyC+HFMIZkzrDI7SVDyHT0uFle35oUFgc0DW4zRJqPhBfi4aeq4FajT5RS+Y55uGtKJcGf
	wQ3HW2joUDVyxlHZjdt4/4oeZBLq95SaXHQk=
X-Received: by 2002:a05:622a:1650:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c4bf02ba1mr87026011cf.9.1783342064982;
        Mon, 06 Jul 2026 05:47:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c4bf02ba1mr87025641cf.9.1783342064340;
        Mon, 06 Jul 2026 05:47:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19dbedf4sm4083379a12.29.2026.07.06.05.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:47:43 -0700 (PDT)
Message-ID: <4bf121e6-ff38-4acd-8fe9-11489b54bf55@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:47:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-5-776f2811b7af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-5-776f2811b7af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX8yywd+aEFTtz
 85OWy+CPEaXFPMFPNO6/eH2tZy3eMX/m9Om/UDwkbrwoCsvcMlt8l7RNRrG0UiWFNgSx905Jfgd
 OM+K1sPlAW+b33q6tsqpivq6k1vtxIQ=
X-Proofpoint-GUID: 8z7RXxhHpNL-BwbR_ekKpnoTmeECEL07
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4ba3f2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NBHrBlfBUiTlkn9WGu4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 8z7RXxhHpNL-BwbR_ekKpnoTmeECEL07
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX+JNLRSU5BGZn
 qsOMYKoMsO9fghrUkcPp9qjZLL8dtYyMCTMIhzVZm945J7/2Eg/gp7pfgSPUKOo9SY6tEIw08tj
 gC4AbHusuhaqiq29adR3yUFK5vCDiF63e0qXG9KPPDMs4XP8t6wWD4J+BovFcKQl738TjAZRLmF
 ZrMXkcZoy7o4GJqEA0/KZMcg0tbmC/+4rckO1hJ1JuHAOKNhawqJoRmopHzM5gapdeyeS0YWnmn
 26+5WarGzCASEmmIJs8vhDdQ8sRFm0KNfRsizYptnYhO/Bum4V8pjDyOUkB0nZ10GlbiJrHcXQr
 0MnvUztJsvNW6TOTtD8LwvDVrJAYhoe8Ut8JUc9RISaQhcu6EB5TuPVmC0sWEQdIn3ZuzuuCBdn
 vYk7QPPbjXi1KWEwpA/yTEggRMXx2qJYlBPD5l4pXgw1MT5mvx4XfvumSJoIL/Iqmd8DZI94LBX
 6mK1BmBHJi0IBLZIWxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060129

On 7/2/26 9:36 AM, Qiang Yu wrote:
> Mahua is based on Glymur but uses a different QREF topology, requiring
> distinct regulator lists and clock descriptors for its PCIe clock
> references.
> 
> Add mahua-specific regulator arrays and clk descriptor table, and use
> match_data to select the correct descriptor table per compatible string at
> probe time.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_clk_ref_desc * const tcsr_cc_mahua_clk_descs[] = {
> +	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

OK

> +		.name = "tcsr_edp_clkref_en",
> +		.offset = 0x60,
> +		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
> +	},
> +	[TCSR_PCIE_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(PCIe4) OK

> +		.name = "tcsr_pcie_2_clkref_en",
> +		.offset = 0x4c,
> +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> +	},
> +	[TCSR_PCIE_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(PCIe3) OK

> +		.name = "tcsr_pcie_3_clkref_en",
> +		.offset = 0x54,
> +		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
> +	},
> +	[TCSR_PCIE_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

[!] (PCIe6) This needs +RPT2 +RX2 -RX1

> +		.name = "tcsr_pcie_4_clkref_en",
> +		.offset = 0x58,
> +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> +	},
> +	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(USB_HS) OK

> +		.name = "tcsr_usb2_1_clkref_en",
> +		.offset = 0x6c,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP0_HS) OK

> +		.name = "tcsr_usb2_2_clkref_en",
> +		.offset = 0x70,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB2_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP1_HS) OK

> +		.name = "tcsr_usb2_3_clkref_en",
> +		.offset = 0x74,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB2_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

("USB2_2") OK> +		.name = "tcsr_usb2_4_clkref_en",
> +		.offset = 0x88,
> +		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
> +	},
> +	[TCSR_USB3_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP0_SS) OK> +		.name = "tcsr_usb3_0_clkref_en",
> +		.offset = 0x64,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB3_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP1_SS) OK

> +		.name = "tcsr_usb3_1_clkref_en",
> +		.offset = 0x68,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

OK

> +		.name = "tcsr_usb4_1_clkref_en",
> +		.offset = 0x44,
> +	},
> +	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

OK

Konrad
