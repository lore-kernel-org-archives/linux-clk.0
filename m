Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9219E3BBFD2
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 04:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783313767; cv=none; b=rYnp7pAzLQGbyVxvdAhy6iRKHBYHFHsVeOwilmVtLnfH27VzN1/8m4uJ9UTsjZxlhqHwdCigqcn/cR3gL6U2Ze3y1jifW7U0G9QKAUT+vM8PTg03ME+56p4nFZF3jgwtyHvAj9m3ShNTDRD34Sh5nw9uqe6eWZN97rFSNkNGDK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783313767; c=relaxed/simple;
	bh=9b/4FZ+3+qRq+fXpfPVgslie5izhocjgJJoFMG79fvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noe5TfPOThHzMbColwj3BqKC29uE++L43QMvvpzZxGu16SkED/KQYe8H9RmNaibnLY/S3eXCEcVfPLYvVfJPPAIIVaChuESGzsIJJSYlxDLdL1NOAYj7+xNJMMoxVwrzhNkwPTbW2D6g4M0KlYqXTN9NYTjfnBp2ERKa4qN9uEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4LmCalt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnrvUr52; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4LmCalt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnrvUr52"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641dGM3402284
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 04:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZuEm94SloL3WtfgsZqmYPrzPC054at/1BedQur6MUE=; b=j4LmCaltYE0CabBi
	kSx3so/eLQvWs3aD8BM2OdPb4VrmUEhXHPRP6PHTurRAUGApb4DI8wBbHohRNuzE
	DwjXosTJH0ygtSmymmyS+PfzIHWEovaj3Tbzcp44Siw+f/A4x/22UrYMU6Lxv48L
	B+P2XT3XZN3nJnu9J8/ccPFFbDqWpKHIyG4kLhhFKrPQPEmEnW+Q4TUTiYRJ5Fhc
	PItKcXkNHhckYJKE6L48DzrG6xUjuDMgn5IAT3D+VncxXz1RfXWKizgJejigU2hU
	5DUV/d5KE3tuU4YXMC3DN+8hnKwDazsWO7HG7W2lGXX2YxTWpi0fYcJEH/VWXwPM
	Cjfgzg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgm8k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 04:56:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so2243965a12.3
        for <linux-clk@vger.kernel.org>; Sun, 05 Jul 2026 21:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313761; x=1783918561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZuEm94SloL3WtfgsZqmYPrzPC054at/1BedQur6MUE=;
        b=SnrvUr52EwfTpazaBmOhtcWGLTHGZaLb+86PCkDbNV4hRXiQIP5ADoO6Uj0apvX66r
         /UG3D2ZtE67N4L4IfWUk3YTR+M+zhTIPOMDzNtcJofS+TB6tXXBAvVTSxcmB4ESSoHxp
         o3qvnu6oRTa0rypi0d9TlLqPc0aI6UZwF2giZ7qb9/bAXo0c0nTwb4vLfDxesVA1AA0p
         urIHCBeIlnCXNZxcHJQxJ2ue2fKUELiN8xgJrXR7Ju1KKpg6wj7SWwB5LbuORb/yXXUV
         1T6pv7HkYB5Ioe+TU9JDWWu74wP1SICM8IxBxtaAxaM3E/XzBuJzbCrjreqjDDaGJB47
         aE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313761; x=1783918561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZuEm94SloL3WtfgsZqmYPrzPC054at/1BedQur6MUE=;
        b=bOn7YoH6JGR5/eRipa8o8bs6jmrpQWcjMnj6GGjy/U0UFSIMa1L1c6ZSqCRyLff800
         yE7ZTJ7JgZ+o8Q8NBHKcqQCAxGy9nqYIme9eaC8uzR+1MVh8rz/q0wM6QM2GIg5CkmHm
         WnkKAzP6xtemfqqbGCHOtKlbB2f/p/heXdK7PP7kWQRGbCEUvGscVb4omM1dkmqm54Lf
         QSizQ718qmh/jsqLKhOEkZ+dpNEnZ9uSyaEWfspAOSAY1ZYfrqkqtaIVVv11X5xFwS37
         fdZkZQrNf39GvJK9o/BWTKH5TNqB38rdx5pYh9JYSS6sUIga/42kXVGuwzKs1vKBEZX2
         disg==
X-Forwarded-Encrypted: i=1; AHgh+RrzlvZ5x1zWTJBj7dEVGkadrRboubFQBUBeImPNyZck+IXLNNT6O1ZspertN3gjg0fRo1NZF42Es6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9BGP471YmTEUOVnfvyYKsvub+qg5HJ0qXAW0Geiv68oY6iejA
	RsLOucdmi0dqOSo9S4h6WLmoTs5lhtBIer2AwnouhIlPmNnDCtLRgQ1mGE8Dgu5ESatdOgFmBJp
	J3ga5DF553n69n4Krr1ubNV9zbrmwaBki5Bm3rbk5akutiNjbIOadyEfJ4bXjr2xYMTdMYHA=
X-Gm-Gg: AfdE7cnJSfGj7Ftnr0toCSu8O/CThL0yeE2anMS6Fl+C8zWFT7QIvx2bXXDMODrGMGB
	tOYP7ThAlox/U9YaX7rO1Rl89DMTWbHbYvU+uI6JmaK/NGpc7rpntlF7liJY/g9esN5jNrzqDxp
	OQZ6G3a9EDGbEIL1d+rhecEaBFlfL/rtl3ONGFP0pDdd0MKED66RjbVclHXu7JVMje8Q2M9hYKQ
	WeRFGVUuuDCpRDwvYwGd5p63d8rr56wPJ/LVDwAIED29ock3GiXCWB7RHPCyEMEMadPk+nCxayj
	h74/YvVQoi4O8KPM2BPgmir0QJ2wGCtYCfDb8EII5f/DUStMRgAcEs17K+NKSi5sHwTTskXsn0p
	mdgxnleGh3yRyj6OrJ/Fbnxo0z8KdYfOsJffVAQc=
X-Received: by 2002:a05:6a20:6a07:b0:3bf:bdbc:bb0a with SMTP id adf61e73a8af0-3c03e21c329mr9214399637.17.1783313761492;
        Sun, 05 Jul 2026 21:56:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a07:b0:3bf:bdbc:bb0a with SMTP id adf61e73a8af0-3c03e21c329mr9214364637.17.1783313761066;
        Sun, 05 Jul 2026 21:56:01 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm62052392c88.12.2026.07.05.21.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:56:00 -0700 (PDT)
Message-ID: <6b691eb6-07b6-48e8-9952-8a88e315a5ea@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:53 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-4-d6ede0352113@oss.qualcomm.com>
 <62cfb2ec-f069-4012-88a1-8667d3f3e5e9@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <62cfb2ec-f069-4012-88a1-8667d3f3e5e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX/g9gvbWLRtTM
 vR/VZI2aqVv/63d3pxLCcF43bQBA+xUNbcda1o8PS3XI96RdpIbzgiRxmaDpm4mO4IjX8IAyXz3
 /mzF8ed8gEgpMdIoTovj/retHVd3ltY=
X-Proofpoint-ORIG-GUID: i9LYb4rq-_aHHU6I7Du10NKGXhMZ9QOK
X-Proofpoint-GUID: i9LYb4rq-_aHHU6I7Du10NKGXhMZ9QOK
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4b3562 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=tZh_4sgZHyZb0SdsJiQA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX+o9NZbhbUtIc
 HgU6/8chIXTBlvnNnOFjXdLmvu9bJsb7ut6wDC8l3ogr+maaOVHurCHCFIQfiGDPbSULEvDd233
 iBQdvOMZzc9kza640dpcZf/EvndrcPDYXIf1iAp0kuimCAzwXkRTKRke6fyL9Nx+t5QY6lzONqJ
 JJ6Ba4/KRJpomHUgn4iRzY838qbRyYh6X3gm5IOEZH0v0li06fJCB0bKgph1ujYw3QBYR/jBdkO
 trPBKeVRCGgYsG4d7KFPsZw+EjRNyBUVuUEY7+lO/IDqdMAZE9lSJ3ySxDEE+cPkdxQa/YdpXmH
 93o8Rl1K6Jd2szd7c4mgzQFrqT7ykjlGLxqD6DTWFRHzbD+4IYQmmPsg631DX5s7YXEYtYM6gr1
 XYgqGZeFHBzAbLYl0ATHpGcX8m9K3P2RN5+SRg2RpU+5OITrvMVgz2+xNbSlCGjp55PyiEg0coz
 U7srpNabll88FCYvHuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060045



On 6/22/2026 7:30 PM, Konrad Dybcio wrote:
>> +	/*
>> +	 * Maili-only clocks: NULL here to size the array to the highest Maili
>> +	 * clock index.
>> +	 */
>> +	[GCC_QUPV3_WRAP_5_S_AHB_CLK] = NULL,
> we have:
> 
> --- common.c
> qcom_cc_really_probe():
> 
> ...
> cc->rclks = rclks; // desc->clks
> cc->num_rclks = num_clks; // desc->num_clks
> ...
> 
>  -> devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
> 
> and qcom_cc_clk_hw_get() has:
> 
> if (idx >= cc->num_rclks) {
> 	pr_err("%s: invalid index %u\n", __func__, idx);
> 	return ERR_PTR(-EINVAL);
> }
> 
> so I think this should be unnecessary
> 

Though common clock driver takes care of the check of idx, in order to
allocate the memory for the new clocks present on top of Hawi, we need
this piece of code.

> Besides, is that new set of clocks actually unique to Maili, or
> is it bound to a QSPI usecase on the specific QUP?

Yes, these are specifically new clocks added to Maili.

-- 
Thanks,
Taniya Das

