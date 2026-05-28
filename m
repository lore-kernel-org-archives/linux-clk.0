Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA603ED5A5
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779971303; cv=none; b=bL6NeKIfcT5QaqsVWDBWzGiOldGfnFRNpZNt7bnHSaXUzcx8MU5kcgOTmueoCOnZ7SvYLvA8DeDMtRuMjTYbbHVizgEuza8U6jdkjJiKkJOsHsg2KLZyZa1bF7jPfIyhdfNdujdE5uL0KSoz60Coz2lCDOTEXIEFcVGxTGw6PO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779971303; c=relaxed/simple;
	bh=0m9I34TWmqjqBrQjMDf0uEc5IBCUXBa+7iFjGnQoWRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lt42teEhB0wjeIZnSDnN8F/qbEPKE2CZ1oWUqUDB/AyyDiPCy6uplJCaTimFoVaDdyzYajqaaHfoLgws3A1HDAYu8KiIdbg937sb9vwDHtaii8lM0YAePPYF6qASk0hyI5IXpAovnpPKgKpG76ga5hvdC4uWxmbJHXJ2xn/Hkio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIbj/kG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MqZ8P85v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIbj/kG7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MqZ8P85v"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vjn82794332
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 12:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P7CNWFCkJuE0aXgNOkJJeWzN
	CMG3mZxFBsF+0yJQu3s=; b=ZIbj/kG7oZOM5CmcxnZ8bU4Ddj/pR/DF7NcHtaT0
	qK3zcJdY58PcpRv7v0i1jOvXVCD8Q5W+O+D+5VhiYCzivllTU+yJ9Hfe9mI75o5X
	z6uk6Y45i2pN4cwa7RuulY05+o4aPx+2zjyps4+KTa/o1o8fh78dXBNFQKWhM9We
	g4UD7bgxu7q5/v7r1oejTfPD7jCcZ9TZT5sDdgvFmi/CHO9L5myXWIjDAKaxnLtB
	QfhG3hdqaL+Xa3P/j7foDlXzqouWxzXb+zdDocCU4gKIgxZa/AcSWWP1ztn7PH2G
	+wQIGCGXSGBBFiYBCXTi9qanoTxZcte/l8cR4bUwqDTfgw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1tqm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 12:28:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3041ab826ddso12652767eec.0
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 05:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779971300; x=1780576100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7CNWFCkJuE0aXgNOkJJeWzNCMG3mZxFBsF+0yJQu3s=;
        b=MqZ8P85vb/ClRQghnX4IkCu4B8tHSTnAmAqTIJy6lAK1I54oQ+qmVfolShEzSa6JE0
         QG9zGb9inbnB289hDLCdxOoXpNXgB5l/JgqwWboeKRpmopjTbW8UK5rf0oSil5Y2xJHK
         2he0/wsFZprxlooJCOIA4YJeGpI/ZHxBuhW8Xp7zCFy4rxzoy4J7/dw5zMXDFXMd5eUF
         FbUMReNQgy639GVwnZmDeoz9meoou2EuIyqOC8qOEUr9JCQvV/V1EKvbb0PsrbZz62EZ
         ChMQ2bKtuZYn57HZqwLBuBBYay7OIWD03iKuEF4XpKXmdv0T2vn5myipsJTiyfqgWC+3
         hlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779971300; x=1780576100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7CNWFCkJuE0aXgNOkJJeWzNCMG3mZxFBsF+0yJQu3s=;
        b=O747C+6YniPsyLtGiRDtCSThfkXoM5w0QfViwgCL5RJMhXMx3w9Y7/4yZrWA95wOJd
         xGCxjmImYUG1tRbb4EnsU0gEIA2GqxIraGgPBckAA0dmjnSnrK+SBbgZz0h/D+FUX3mN
         JFKqReCYtHe+9F//MipNoswin2nCcV/ZjlZhbQd7+W1fq0j3kbUaParneUxW+K+w8FOL
         sZ4MgH2XtHrCLp7j8CGaC/YB+o8zpGnha+89y+BlMB1wvlOuE2qiZD2j5eIvk0gq48tV
         DW93S0Ij1EVUho72pdc/QXAngumLgzxsXKHwbKXAaJdC8VABB34ccFFhrOeDOrtPnXo5
         MQzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dF/KipGz6CztdbSwFgkxoOM+GJNM8JR33a4/euWFkXfRtdD1V63zhe6HX7SU9RjiKctCXPjyUlxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyltT00LTI+EvZRYG7CUP0pQQ1R22RjnlA+546qci7JmF7Xvuee
	/GDISsQqBHN4HOelE3G+oH2tP7tBc1chiHhbB2jk4xjZKc0BtElMjbXTfa5RiFgaLlYGuqt5wqd
	xaQSj2hC4Z3INJR7VHqj8YCPtvHLgeiTd0GTyo53maP1LGtcPRWMNZELhHrL4WkY=
X-Gm-Gg: Acq92OH58RxfhsSuZDt8/XBapjfXIH+khkKtbhvu2+9rkB1K3wGW1xeM+DrE4x9/lic
	VYlZ/3aeoB+UK846jyppD72P4ZhdpJP8Z2lmd396OE8E3C9p37rDFWP5VvA9H05ONZIiXhwu+k4
	To8nuXesOHmyLtySpdzo0jc4RVLepg19/X75hicFo+ldtmfK+gT01+J12WOlvhFQnz3XOCDYZlQ
	A50uIoRkr0tPldKIarvxuO3QQBdU/bw/f7lSx55euwgGwVUxNFD9aoof9xpbWihsTvHMYja8gky
	gYqJIbLkh4qRF0N4L8GHCIdxhau2nfwz6/DZI6g5+y4m2EmoO2zchtNrGLXVzOlr6Xp/qA1McC6
	LmVCYEjbg/qGeMmM4lBApDmfmnktoomyGXFatEt7iaaL5rnJKO4cA/o0bvdJBGooyMU6ad4Es4D
	d8HnY=
X-Received: by 2002:a05:7301:5807:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30449096805mr11884147eec.23.1779971300089;
        Thu, 28 May 2026 05:28:20 -0700 (PDT)
X-Received: by 2002:a05:7301:5807:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30449096805mr11884118eec.23.1779971299562;
        Thu, 28 May 2026 05:28:19 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245d6aesm14523047eec.26.2026.05.28.05.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 05:28:19 -0700 (PDT)
Date: Thu, 28 May 2026 05:28:17 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom,sm8550-tcsr: Add
 QREF/REFGEN supply properties for glymur and mahua
Message-ID: <ahg04dmgSWPuA4Tk@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-1-ded83866c9d9@oss.qualcomm.com>
 <20260528-adamant-termite-of-drizzle-0c39de@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-adamant-termite-of-drizzle-0c39de@quoll>
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a1834e5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=48uwnw2qJDGHVwkyL2oA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ew2b0l_XEnEJvhpk_fn05QL3aS8swNOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyNiBTYWx0ZWRfX5rjdLK2ip7TY
 V0dL+Ogh+CTEzuky8ZqS/wdgMRmtQ2bCHPYmvBywJcOvreVSi76fEKQsbcXqXINWsrwVbZKFgCp
 hGn5H8ZWJCA6kzQOFRCiDsPczAvAZWBuferd7z3Riavi6RCZW+nO06vQsehI+/xSubE/f7I1nvT
 /tvfPiEBxWcVCASGmGGtQ2su4AGUmGleMcnEqqAJEPFJs0dWxrEaiiEwwzgzgxOWBG1JEKX5vpG
 9XhFGviycmzHjrU0cQLU5SE9earreSYi2bcWrn8Txzd8xlqbOr6MU1+ySaIXwSfO1SOfsbJLAQR
 DWY7b4s5wHt0gUbIu1vNlUsWc/Efgg6KZEHnIJffB1PtUYdhrV8V2K6HCeWAdU+ACizcOcQkPEo
 bRBe/20CsGz/yKGrNUT7YgGFZA3QicNqItGEZUjIIZUIJqBZNhdc2u9BXXLc/U7IMOmg0gYtCgO
 IJ9KPQ88byi7RAe31bA==
X-Proofpoint-GUID: ew2b0l_XEnEJvhpk_fn05QL3aS8swNOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280126

On Thu, May 28, 2026 at 09:57:10AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 27, 2026 at 07:29:12PM -0700, Qiang Yu wrote:
> > The QREF block supplies reference clocks to PCIe PHYs and requires
> > dedicated LDO supplies to operate. The digital control interface for
> > QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
> > QREF has no dedicated DT node of its own, these supply properties are
> > placed in the TCSR node which acts as the control interface for QREF.
> > 
> > Document the supply properties for qcom,glymur-tcsr and qcom,mahua-tcsr.
> > Both SoCs share the same QREF TX/RPT/RX component naming, but differ in
> > topology:
> > 
> > Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
> > has a single QREF block fed by REFGEN3 only.
> > 
> > Mark the relevant supplies as required per compatible using allOf/if/then
> > conditionals.
> 
> I don't think you implemented my last comments. You need own binding
> file.
>

Thanks. Do you mean qcom,glymur-tcsr and qcom,mahua-tcsr should be moved
out of qcom,sm8550-tcsr.yaml into their own binding file, e.g.
qcom,glymur-tcsr.yaml? Can I use a single file for Glymur and Mahua?

- Qiang Yu
> Best regards,
> Krzysztof
> 
