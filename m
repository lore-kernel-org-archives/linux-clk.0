Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599075;
	b=AqZlKbkJ1lbVbHWdlsn6vt8jMjuch+UGYY0FheY5Z2tR029nlUIDnh8Y+jjkgovqFWE0
	 QQnSTe2rA1gfqmcRq6H+VKTm+PTBXdMBC8HrqPEcR/wp1MgtrGO+HiRFBQTLY80w1/6nZ
	 C/G802tDF1Gyz7ALJbAmtWdVAmaOCK2IGPK4WjhJTMsqeYmaPjzx1/vSANcxz52YEXFpd
	 i38FSFRjwZXLs2SsZH67JH2I16iafN103SLMQ4NkrP25h1BIFvu7d7vwejm9Mb0xyG9GM
	 huDFyVGGSNBhejVtHZITP4bryIFuVTGzxOFjitiUTgtTX/98fpGP79JvnOVS9/emIyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
	b=zz4nN9RCKBwp6FGy8ZKbllHGk9jvocN4tKDQX4BcvvuBAlFNB5OdBMP24WIvKoXGPUjf
	 LH5CvAp4UXfY86v77ATJwr90VOGzbCgegVwvYfpTo8i3AwED4Yt78lhJMUJeQCZox5XlO
	 5G0wapYgbFmSP1DxwssrWuz4eIIyYn0uC26KRuCNDnHhScksBHHJOoj4X+RiKoywOT0YR
	 Bbqnc/XK2rIEgbNeZdBHxXDU0DE2C5NJenReDM20QPuSewIBzjn/oFSD2X0T+EG9DqMNP
	 WdLMqvPWALhRagqUIj06TJtiB71utvM/CFahnW5jKXaUE0p00hYxjHVai8U4K7kk0+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0ihCasm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F1l9lRz+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE59F606A319
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE59F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0ihCasm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F1l9lRz+
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU0rj682114
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=; b=V0ihCasmkW/aMZhU
	sJcKm5nYfBNgtmimC6O7UbcbXBSTyusSedqc2yEm3bxa7yo4kC/bwTzn6LtAiUmu
	AeT1V8nos2qZSefaZ407+Xb57Cqu4fP1LhYtXy0jzYOOiDnTFYP64nFLSJJbZ30f
	gvGmQLRMS8Tu/KcL7unDk5qS76Xgpv4KRncYh6RxVaJLdZ7lmUqxvMp31bI1OCfS
	JZSEOprQ+ZWwAPZFP2PXPW8nvdtSxzSK76NM3OKetaWL4LvJimIjkmk0Z0uSTdfr
	FFAyJzzOm0e7Czj5+SBx9B1KD7CHqZI1VgsqiECI9iEK1vRTB9EWwnjk1gpHNyPt
	CtddPQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vrs06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:11:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a06da65d92so643741b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599069; x=1793203869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
        b=F1l9lRz+st+JFp1wukMvXHgwN6aZd/ZBZdwdPeP9xFepSh7WUVfwWv0LH9N7FuiKqN
         zR0p51614FH6rkClZrCyaSSuZHfNQ0oOPrqAzaJq5ouZVRXA2Myoe83fTIe26jEmZzYU
         f5BBfWvzArScGXlfoduJEgUm4kKDK5Er8DjRs5XVBlePR3olBVrJbYMmS/Ak1+h/2K+m
         NzTeycTF6RE6jr6jmYa+Y2zHCIeIB25xpeGplHJfX/wT/UIQxytGG+RA3O36Ub/Fx6PI
         +c09xZZhtSOoWej9srmOmCeUrx+7zfYQJ3fcnvblJCDtmbPcDWNq7aNmWkhX+Pb2huY1
         b/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599069; x=1793203869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
        b=IydGy4cHRu08Jp+lWo4LAp21KcZDMGhCk2DWkVAc9FK1QJjBEWaOt1EIfkXkgpM6R1
         p6UesmUG65+hMjQ8tr96vfZO9LUtCFn06FE/ejrAZnjBgUrzViBgXfnaKOMZeCtoAstf
         KXmqjER5hUT83zBph1bu/OV1nGOJaAZ/DZRdnJxQk04MgXo4y6/Hi9HH1EkYVJ10PTSf
         u8SKt4VuSkN4hswRi+4p50qN/YYjJvXQg/uRViISPfA74Tq5I1nBoDQPJBTgceFloCEM
         d3QgXs16pnlAwpTNYv7mnIf3AnvYM56oTNvCZ6mhvr3Z++YRI6BznGzr1czTDyMrFeMq
         1RkA==
X-Forwarded-Encrypted: i=1; AKwUvBxi3m6wdej8evQYNDemzARG1i15GL/rKphRJgVTFsIWLDEGS9lZGKTi+6rNrA5lnMhpzdq0tPL5uEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPMRp6lnjHFrcS8jc9+Z2rUtacWYGMw5o9oqpn+ixFIWwB+8yF
	9QKCbnfST/yrOVj9nzxvhkYMIw42SLQkIp3Gr0ulsKVLtd2H/S6qx2aNXbGb17Faz8Gie7ILrOI
	NAaCp1hnVuq2KHW6lAYFQSnYP9FLI4Xp8lLLOLsCfRZgDxkKN43NjJHlEOd9HH2c=
X-Gm-Gg: AYBFou00WTJL3sjPfWsHck4r0I6FbRxpVmo2DrX0Me8B6mz4uqeZB8YJN0eADYQcCR0
	tXuesy3UHJDuVs104AuZsLctDrygMogQYoozPBHN33z6XPtDlkf3L+ECsNR25JKTkqTwrBJS9ds
	SNsN5nOxx6ES0UqzmGE3XTl869bdEjZ/A138ambW+Kaqj/D+SejNh+jItSZaRa331MbjYjC8A3Q
	xYienpezsEhXlCrldBspAGCasQKbo3c7aQyXqe4Lz1P9dpky3u3KAcBr2w0kWC13IuKI9XFITti
	HKyD10WfGfQgBSnI1oDtO1Yov69SG8DMPLMKtA1hjPXQAcZhbATMjY8IedunJsvU09hk3SxEdPu
	CKVqgDsfyyc+MChF13Ca4yN6fYjJOI1O3027kB+wrxPzP
X-Received: by 2002:a05:6a00:1905:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8a089e1f4dfmr1918087b3a.20.1792599068622;
        Wed, 21 Oct 2026 09:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:1905:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8a089e1f4dfmr1918081b3a.20.1792599068148;
        Wed, 21 Oct 2026 09:11:08 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b484esm1095569b3a.13.2026.10.21.09.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:11:06 -0700 (PDT)
Message-ID: <a9900595-eed5-4e5b-ae8b-212597601aeb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:41:00 +0530
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
Subject: Re: [PATCH 4/4] clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock
 controller driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-4-fd4c2b3cbdea@oss.qualcomm.com>
 <fefaa398-7542-486e-8cba-7f875ab021a0@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <fefaa398-7542-486e-8cba-7f875ab021a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fKU19VEsWf1nx1TyUNDTHYx1pdNRY3el
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfXwnREsrOE4+ZK
 esM6b69nGZPGGFZsGCKhAq2C6WuNok2hqmeIWEci59QNb9RfV/i2gpWJhVL5/rBK7AqqHbpOCfL
 OqQN1vBkt9KZZ6GjufuOa9V2/jjZvi4=
X-Proofpoint-GUID: fKU19VEsWf1nx1TyUNDTHYx1pdNRY3el
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8e41d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OgLFbhcrQp8kNKIItaQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX6+FjtUWhfDPJ
 hVazdaCySSUPy7vD/vpOJMotQ4FEe1WZNyQLonSWzmAnCalp73YaYVfzK7ne11VnCtUimXcFUsc
 QGLTr1yNf2rHcR/+UE3XZ3gJv3SRu8EC0WQqsdje5EaJxGfUWTjLNYeFR7Kh197+FVh69F55xL8
 IrZWeIkDjrNIs7cEa+sPD7IDmu0cIPciNfiV5uqBQlvr8VvUvG5by7QZy6i6A2KyoYa5OzeaRQC
 lh0Fl1JZZVgy9WeswTioSyOjFeuKYAGn+Z0z4VfLeRriBkBgLangzICnq3a1x9vA7RHQwWT3Zq+
 m7j82hzNgyVWRNMYO3l8mrSOjTn4xuzD8rrPqa7Ruy3rp3EOZn7xWIbBCclV5op6LTGIDPeBRfT
 Ut9w/0FnuJrJZnIEwXGAkvodDTdS5wTpsMBCcrVdNv9wrV3WQeYD5W2qGgBl58hQ/0hRShHbs/Z
 UMoJGxoIXQlEkhrZ+WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064


On 10/16/2026 7:22 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks.
>> The four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the
>> L3 are each clocked by their own Zonda PLL. Each clock is selected
>> through a glitch-free mux (GFM) whose parents are XO, GPLL0 and the
>> corresponding PLL. The gold mux can also select the PLL's post-divider
> [...]
>
>> +static struct clk_branch apss_silver_core_clk = {
>> +	.halt_reg = 0x8c,
>> +	.clkr = {
>> +		.enable_reg = 0x8c,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(struct clk_init_data) {
>> +			.name = "apss_silver_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&silver_apss_pll_gfmux.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> Do the clocks have to be enabled even if the CPUs are offline?

Yes. The bootloader leaves these clocks enabled. Marking them with 
CLK_IS_CRITICAL prevents clk_disable_unused() from gating the CPU and L3 
clocks and hanging the system during boot.

>
> Konrad
