Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB433CBE95
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788699847; cv=none; b=SBf9mrmMqnr0x63IixAOwEZAmEzCsD/vOszAjfDvCrn0SEfQK+JXexYYvZciE9CoR2ni8zlUb/uK73G5O4kt85DxhHUNKso321qS+iBbviMC+czoM8BIX65D5WgDR9pdm7pZcbF39Q3HFP6togg79CM8KxPd9OUQ+2vC/deMyM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788699847; c=relaxed/simple;
	bh=QjW6DhwnX9n+G3RTO3v8j0+GcYFZ9juol3cYQRMGnGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RvalifdA7SAhqkeynEUWsB27YRU57FosxnaM+FQbxmzkH5k7YK9k76ww1b/3ZrmTyqWWb1RG/WVxQwjfPqX62/vbQ3jMBG1T5MA2gYZsPQbPjpZQVFit9HX9UOdCWG1wHCvC76nDp2F7j4wJwQEBAV9PCIWfY0wUiY1dBKG1aSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyojFKwt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LABD1LQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyojFKwt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LABD1LQ2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68600BkP3937928
	for <linux-clk@vger.kernel.org>; Sun, 6 Sep 2026 13:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2ysWDTJuB6llFpSgzIb+oRVd/8wf1+tQbxSGKnBlYo=; b=JyojFKwtf2ifnGD9
	rqNm9nNk553PPGh/DWczZPq9i1dXHl11Fa3JS9d46iDfFj4UCTqWWb3vN40k9rOS
	EopsvEIDaS2A5Atg1ooeu0sQo8Chp6a3toS93qRXad+6uZkZa0AzTkSTyQbh1jl3
	2NMQR3W6rl9dLKq5JX3ZzjJT74fJ9RwNotrS7kaSFZqOix62CjC+urMDtuGWyes2
	RhPObL4xyDmTAVStl6YJeOFFa2ePJldo1EljxnRDJUxHcKi7GVNlh3P/ZGPXcuiA
	WR7khhR+7HQVFNjFDzWqD3jKwa7kO0P3oBOht2iNS5AIaB61MbNvGalb4PeUQIep
	fKzgMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vbb49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 13:04:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f80c76e6so50159575ad.3
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 06:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788699844; x=1789304644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2ysWDTJuB6llFpSgzIb+oRVd/8wf1+tQbxSGKnBlYo=;
        b=LABD1LQ29kzBTN4Xy3jFhzc5wQo1idpBuR+ReI1Ukwkj+wUW/YLWqfVd0o5teeeP7E
         /YwJNFRNN+tkrDkLW5Y5ZVXauED20BALoXaw8e2UcuaeUX26AQGkpSKIpp1RcvGwx485
         1YfzPjWZFVSfOKn9hmKUpdio52qiZsMIMwHfBY4WKv4JzSot0tInzeKIInburWtq9Zxz
         KpeHloKQ0NKdOEX1e2SRpoShAS+SibsILVOob4BliuU7RJSUc0jD2l0BvlBLKGSBuzs7
         o4EIID8Pq1TXTaOYVpoPygoU9i6u0w7lrjfs9uJyypATQLTxc9CzhtRlbS8AfJSQKHH7
         6yPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788699844; x=1789304644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2ysWDTJuB6llFpSgzIb+oRVd/8wf1+tQbxSGKnBlYo=;
        b=tJqL3Ib7wB2Kpx1LJSGRTpFKCFmwJeG2cChFj6bPtObL6+AXRYuJkKu8C/6C3fQgNE
         0ry9sNZI85F/1PbBqC3fUoJ1sspvXhw2bxvgVqzsAeTR7H/Me57ascNLciX3CMVz+xYC
         lRQXOBjCo6QJZPWEUDS94BR8DKJ3b5FpqgVqjd+v1pFgOQui92/i6L7cVYGgn6q4ozTv
         ltMDP/8hM0DDnHEvp1GJ+EY5k3RZXjSh/joDY5Uow/ZHnHpYA2ocvwRaapbM1IXep81u
         wVzBwmo9jBwWl7KnNM3ae4jJ642NXRB4WQPqglHfzuRD/5a7DGl7CIScSkxz8vk9PXSS
         1kPw==
X-Forwarded-Encrypted: i=1; AKwUvBz3QcU1or1CPdkRLnoaK0aOowENCOY5Lo6v+oBtpegURqB59dAiUVakrwBYu1h90P+WqEo5jqWVAko=@vger.kernel.org
X-Gm-Message-State: AFuF++noGpopeCNJmjmDj51vZZlii+1cuf7MzVV4tSvLKbxAHm1Y/tKb
	kK8uuJFsQ5DAGlQVq2+Ru/n5YzwG68fXTiPR2ovOlSur4lxn3e14MMTMbGjI2a5v2QKvtxcdI4j
	Ijrxq6M0oD9ewW02dIX4o5sJT36SwbTF0HedpspOfFSt3kqnltgMelkgLP5KuGNc=
X-Gm-Gg: AYBFou0o5l5GJbuqvqHBug4/zq70uu5d+1yWHyJ6s+7jDVAHCgVRjbq0k8SXshhik3f
	BGJfJztEOpoP+HyJ322vctRBXHnS58iusYu42T/VWeGRsppN1mMwYqh8QD1zZxN7Hup/BMZDimE
	3M8q3IC5Mn7H1amEWwhkVmql7Wd7Ie+m7MgDBJzdyM1wzi+hjUTp76+IRgZ8O62WrMJxr5snukB
	TOoekuXOperWIwTWlpi9r9+KzWu+PRitGUE4+84+a25McStlDPi+4Hczr1TNQ3+AWvQZU6lyvXL
	5+LSSdDkLVTTdsvXd4u6tYPe/07EIlZgrCaKn+0KFWipP8oeLy6DOdLq1/c8NyysFTgg2xKwllO
	3oyy5h3i6fRjrSzqqB/+j8wuG0ulH
X-Received: by 2002:a17:902:c403:b0:2db:2c09:98ad with SMTP id d9443c01a7336-2db2c099a0fmr129398975ad.12.1788699844056;
        Sun, 06 Sep 2026 06:04:04 -0700 (PDT)
X-Received: by 2002:a17:902:c403:b0:2db:2c09:98ad with SMTP id d9443c01a7336-2db2c099a0fmr129398165ad.12.1788699843535;
        Sun, 06 Sep 2026 06:04:03 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm4104133eec.20.2026.09.06.06.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 06:04:03 -0700 (PDT)
Message-ID: <03368f56-5542-4c02-a4a0-f57d5cfa5766@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 18:33:52 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-5-f7bd68b5369f@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-5-f7bd68b5369f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qGXdcA_giIKPaJ5UbDbzEK68YN9GnkZN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE0NCBTYWx0ZWRfX/8VAAnp40m6i
 8yfbYm3h79+Xyl33wTYGUkQKonnhPRZ7hYqkgFF2B6JFrh4iwbECW6f/bNHLSCkEs15F+JrA5hi
 9uzGgL/oHuUKIQj/hlS+4XZxhy2yHl2+N0x4GYgn/7eXDVbxFXcIeZQGswusNnDrPDJSr9j/Ndt
 niNGXJsiggbkfEDE78iHXmC9Ftgif+eKqictDGO3CAOFtb21wSPPibhhvaZtMcyZ4QwJjUJuAlF
 M9anuwOoJvJ6tMAav9aLjPaFXmH1yyGWU4BeXK56nfLbLhuJ3tKr+htrVA7HLYZDY/X0PP1rXFo
 HFyZ4HmsVI7lYXsrBMcgDQW8+h8V5mKIayKnPe+zazl+XD3ts20F9GYkbUQyZwit/b/oO73klDs
 4FLtZySmBfbQDW79VGgN68X4n0/fj7f7OXbCBPFpgbFSJAvxXG9aS9CUzTdUbQEXaMw9GjWDjYy
 R7sJ6IsbnDb4h6KdguQ==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9d64c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=uHPnOIaY-gHs_qv2vRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qGXdcA_giIKPaJ5UbDbzEK68YN9GnkZN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE0NCBTYWx0ZWRfX+jgPiwQ0mVtC
 Cxy9FXMPuWQYywIqQMdWLjrXPm3GcCbYeqE+QA/e8gEPPBRjuGPJ9XGC2s+AKvFNGyOme1V+i4e
 HqbrrXQJiRGmQkpNf59FEBA3lKlAz0M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060144



On 06-09-2026 17:22, Bryan O'Donoghue wrote:
> +		if (lane < lane_base || lane - lane_base >= CSI2_MAX_DATA_LANES) {
> +			dev_err(dev, "invalid data-lane %u\n", lane);
> +			return -EINVAL;
  CC [M]  drivers/media/platform/qcom/camss/camss.o
../drivers/media/platform/qcom/camss/camss.c: In function ‘camss_parse_endpoint_node’:
../drivers/media/platform/qcom/camss/camss.c:4783:61: error: ‘CSI2_MAX_DATA_LANES’ undeclared (first use in this function)
 4783 |                 if (lane < lane_base || lane - lane_base >= CSI2_MAX_DATA_LANES) {
      |                                                             ^~~~~~~~~~~~~~~~~~~
../drivers/media/platform/qcom/camss/camss.c:4783:61: note: each undeclared identifier is reported only once for each function it appears in
make[8]: *** [../scripts/Makefile.build:290: drivers/media/platform/qcom/camss/camss.o] Error 1

CSI2_MAX_DATA_LANES is undeclared here, causing a build failure.

---
Regards,
Nihal Kumar Gupta
