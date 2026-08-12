Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CE4423EAD
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530354; cv=none; b=uxMyPbh5qFGCyNGmdP/6iJE+/OwezKc6mrw6Z6xblCUe7NF0Tnt+5EEOy3stkxTciVGjcLssNu91wqOgrAiMkVmB+gTn/G3968GJw9UbM7yNRo53F0Ge+OnarVhbFUe2oMHt4YzWfotRRRxA2uDfxrTRk6CD2fHEeGnH+QJkeMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530354; c=relaxed/simple;
	bh=43ZtxLEQgEc2nSYw8I6WPRpkEw05Y+onxKctoBY5fQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFCXTPFsumQca9/sgz5/E2JhligIpH1c1P8XD+9QIBWWKx7MPBikCM92fG7ni8XSne+CfS2Tx7wubO7L6S5Tu8ZcKn+iG1fvgGHz6YvUEZ0ymYss4mnyCbcAYDAQODCe3QPQRj1miBiPBLUCeW2kau2hsLYbXq/jBXO7/hnh3PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7tDQPsa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYNvFkiT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7tDQPsa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYNvFkiT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fp3w3357791
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 10:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=itKa0IklCTLvkwuwODM59UvU
	btDUS9Pb4Fx4zsEu4jc=; b=M7tDQPsaqnGfQIPLcHDUggEuErnLz23CCNADcQpg
	BdEY3vg4MfTWDCf2dW1A32dE5BG1q/+fRD3FFURlDTzSTczLqAXBPu6KKgkAw212
	asqFXGzinwws9PfL7RKZ2w3c/K8SoHijmdm9xtUOMXyEgM+Ig2pz8eomUTirztYl
	dSMlG8Ni0ZBa4aNdeCuz/qGkAODSZ+t4FRBc5foiAWmN0GjiOfyWPVA023t80KGW
	MZQV1C0r4x82QMl/fpbhAXHp3sK+YnFCci454RDFXAYKqIgdBMWMJgl6KHQVF+fu
	Os10BIxgbvplwjM+sD1yYvySZEoV/v9qMnv70QObqvhukQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1hbxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 10:25:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso5939441cf.3
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786530351; x=1787135151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itKa0IklCTLvkwuwODM59UvUbtDUS9Pb4Fx4zsEu4jc=;
        b=FYNvFkiTlROd6wn6Xc5AWxGyB6zy664emIl1cZ76wE2jfhJy5ijO7e19VVmLt6B7S/
         PvPg1oUHClXNCFAvlNa6Lazgu0bRUqi9FUPcmsCASIJxgrGN30k6wen2f3J49ebTLjvv
         oaSbU4MX3H2jZAkBJyAVg/ImSiW8nV2KpOEIZ+YdebBF2NtGpx6Fc9rTwCy7nH+qTX7E
         dy4fcRnKY4BU1XgtX6GlAweyGuGv0lDUGBBU8Q55VWrPcBysOg7zvgi//XrZhQ0Z+wtF
         aYbrmazIVHJLuENwGi8ozMy7xAauZkjuLWDUCfn156MVBOP3XTc3YAzmYgiGIjtD5Wvq
         WLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530351; x=1787135151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itKa0IklCTLvkwuwODM59UvUbtDUS9Pb4Fx4zsEu4jc=;
        b=qldzZ7V6sHDRcMzPdUvJ72cJ7llhyF/t8KbzmvtRnzage5g7un1JToNS/ggz+/AwNt
         TLIO+Oamkxo9aD1JWVcAzT71VXkMaDxKXE8ERiVjvium8lJ0k1BZL/G3Msyz3CBchYHw
         DP7hT9yEE7oTi/RqHsj20Roc2dvi++EoCPD2HgV75ezjrJ10xKFBSWhHkmBOwzKZpifM
         nXKgmPe/fd6DVeHlXcGelVE+kZ7iYMklASjfak8m3owv6bE3NR8vHVskdoHIM9YfKefO
         rELeClnHE2u1jCEhe1joLRqQd6xV+P5nb64AMrN3byVPVcVFWZTOgfQgRsibh1xQ84DX
         +AeA==
X-Forwarded-Encrypted: i=1; AHgh+RqYLYxBbkWwusqXJ2TCt53M4rjw1toe1eGuKPKPYaX21Eru8QwP4RXgt16eip1Knf7VY5ql/c3JyUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jRaW1rkXJuqOQZFE/AjVKvYC3UpSdHvTiNAMJnSO6n82i0Bn
	LDAXSEUtVecGJMucPCSkU2D0CuhI8o8wH1h7tOMPkWH1AZAfq0JuTeq3Mc8Jx0Af/DSs4OPb9db
	NZmyhbrjyHIX87PGTaVVlitnVVO2C2TFPLmAb/1EkMbgQFMSFX07mqavW8IzxExw=
X-Gm-Gg: AR+sD12egU7m+gdaYHjvrJ5uG4ZQ9YYtoj2F5znHSbQBpMwH+oWOHowlZ7FC4fEgcf1
	4ZPTYvIv3ePmBwJP/u1EcbPOuIS9jjw23UPa70EjFUadPZ9HcQ5nZdSMOR/dbRVQkRKz98MSOKZ
	eaJfbss5i5p7RRVMglUQQRXCd+GAN26CPuNhOhmyqhcsWpPdTnecgKj8iAPsIqMAJES6r0PjJ1q
	sXTjgRMbb/0TuF8JoAc39iwnJwhGBEPY0r8Fz1A9dx9kQCmcpfxfuNCT5qesDF0JNcCNGeCgNDD
	Oep1mkGwsS6eZd3yaEgMXfljdXAgX+CYkLYOCHABKVWpeHSqxKlS+jQKhW1DROOea7O2eUtnWAI
	VmuUNwXI754Qf4vg=
X-Received: by 2002:a05:622a:2d1:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-52d6486aa8bmr29583061cf.28.1786530351232;
        Wed, 12 Aug 2026 03:25:51 -0700 (PDT)
X-Received: by 2002:a05:622a:2d1:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-52d6486aa8bmr29582691cf.28.1786530350664;
        Wed, 12 Aug 2026 03:25:50 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b22784fsm36201815e9.2.2026.08.12.03.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:25:49 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:25:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: hamoa/purwa: Add QREF regulator
 supplies
Message-ID: <acuia2fqmcaweqccck5kenborlevgcccffkwtyphqfl47izzyu@6zkwtvtqw5ry>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-3-dc7627169c6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-hamoa_tcsr_qref_0812-v3-3-dc7627169c6d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ih8ZhxQHnLFsiseiLUSqw0AdwgtSAte4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfX9HCaBuf+ZSpA
 pyveiv7WXiUlbtmc24BuRVTE86XHo+hiKx0H4jruPTpiiuk3urqDrSj6gHtf0GBRnyS5SFgEZ8K
 V7s1kZPqAGg+w1ky7quwloU3iRpHs3U9bf6fQpJp7w/VMajX0xv/RcQgAnMkJyqaNJ37/4jRho5
 wOiPEWs/38s4bkyBdpDahWK7MpmabdXZt+nYc2wfd3hLkbEqWFv15GPHua6wHqoJ8UqQeQwRRT3
 naMjx3TQeKLGat6UqUDKae8FJST1j5VRuY8qxVXAQFkyBcfcLjWzbEVq6+XG4kCzVfNiau1SAZi
 NehxsHGsfdACOF0owFYJMXM1tZkhctSELrxZiVIdle06XHvKVloKOS7EknvSI/6svFS0uhQLhC0
 rfhVyCuFcZg7b/gaS7JGuub/JIki0dePkxn1IhW8VrZZPCaiIA6qYYvVLSBVagGhZB/PTOvtlT2
 pRHfUPZybh/s0c0sp+A==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c4a30 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=L_HiXLETPf_ozzabBtUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Ih8ZhxQHnLFsiseiLUSqw0AdwgtSAte4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfX3AR8bwgS84oX
 +VtH1DKzCl8e8ALzc2/lUmvDLDRlTg1MaZvxlpj33J8YABDWjwufOakwFPa/HEl56sG40tErbTk
 nUVL18yD2CQt4PjiC7bgKeONETEChyE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120083

On 26-08-12 00:27:33, Qiang Yu wrote:
> Wire up the LDO supplies required by the QREF and refgen blocks on Purwa
> and Hamoa boards. Purwa's QREF topology is same as Hamoa's, so it reuses
> the same qcom,x1e80100-tcsr compatible and supply set rather than needing
> a dedicated one.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
