Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A56338AC7C
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011176; cv=none; b=E6VmNJp4GdmQgjgMRWZdOihfdwPmm8Nhg9IO1lCUDaV/Hd8OF0/n9DUoib+zKWeiTFZdPUMJKiQdDsfRUDpph+CGFFRRprEk6nY5dFBBRoiBLWsTIqluqvXLyXG6P/c3/N2XnhEWrhb5+IxUuB/khYGvgclSU2j4azhf8s8PxDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011176; c=relaxed/simple;
	bh=//8iWiFvKogEgxg5aWo8MICva+eCyTt+/xwkksFvMWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmDtNj+gPwEDA2j9Rc73jQqBFf+paTTeM8JzZSjhqGC468nfQAej+R8qK/kx5X12UsYGm27PQvzkYPQoo0SXiy9ItutvddQrF91XBfxG1cU72OfERP95xLaYs49KNcTN4+uDNUowlmi44W+hAGlMWrZAGRWrz7B3veRo34bLajI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RazRFTX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXNauSbC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RazRFTX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXNauSbC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6Sd973887416
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 06:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9AsF7cM1Gs5GLeueG8knt1J9qI5sm2l+JPHS5gcbxE=; b=RazRFTX8yxRmC/Ev
	A65GVIWv5xRVpLVckKTTJqLCPjCU6A6EwozTT7SSTMINXy2LeaRtgy1mOqgqYC//
	tkXBou0EL3q6De+yiw15XOcfSt4PiZho9G+pE9zEtHyPBy+ODF8cftvi34S9qcqu
	Sw+NisFIhwUmlkiJukxBWg9rxXOPKom5ScRxOJkoCUxgnPljRkAq3p0dxF3pBa8O
	wsEbiCKtKWisvXKrY31hHNwo/7iYs8JBLLjLY/3gJu/HcGY3iW7oyGOHp8HoN3VA
	l4TCmGGlYeJeHR6Xepw50tfnu9QR62RZGSxSuMIK+uRE6IZWEfdQ1ffN5vDr2gNA
	bZF5Dg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr48wrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 06:39:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e59d97df1so62111485a.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 23:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784011174; x=1784615974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9AsF7cM1Gs5GLeueG8knt1J9qI5sm2l+JPHS5gcbxE=;
        b=YXNauSbCkQ6DzB076ii4oRpiJ5FLTxBS2TgcL+a58FAftM7qqzvuJN1/wP5WV63CnN
         J0DCK8aAg7ZPyMinK6T0epHAEZIn3f4dyiMpy4X/PEplnH4GvmTF9dw2Zde9lXabXn3p
         nY0xvni7/8Augjc9VbrsdZwbLMoux8FaO7jOkZQGWYux43VBAGymi79XzmAYq6R9vQn1
         M5j+eN/3YrWM45ijlZ1QMAWcXk8MjijlO6h3+MlE74xOKzK0Hgn4F2+wex4FxtTLgkyb
         3uv58dDK886WxX89xD/V8rUH/LogRSDgfpzjaiOJv/IfmlLY8mjUTf2hCgAjBzZdZxJK
         i/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784011174; x=1784615974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W9AsF7cM1Gs5GLeueG8knt1J9qI5sm2l+JPHS5gcbxE=;
        b=krib+AxzydNfRBgoBe44LPPjys4ef+gODLf5vtDxJb0r6MZ0k2Y5M2FBzGujIzBMMq
         T/5NwggBIfWPG2xWc8mbjAUxEjR4LqthpPu/O62j66lyP15lUJpnjUezmV1F4B3Rv9KM
         75tIiJFUBjkFDyarF19msE7DBg8leljs6g7WHIVnEpQzPFG1CZoJGthvW8q281pEqyZg
         46sWy5SsndhhoDufqVgzuKlN/r5HVdhkZGcOW0gJxuApg0qrkcPnh0VUnqMT11ALzTZY
         yzwF4uEKKBlPp0gPV8OdIN6xWlDjX+W861PzSPd/Asks5SXGR3p/0x1sXEeVM8fsassw
         VOfg==
X-Forwarded-Encrypted: i=1; AHgh+Rof25N4mGPobC11u97zG9vMF3ThR79bU5X5HJlYbalDg8Bd6J+rAw7E7kMhD7RB+nzDAamU1TWQ79M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAX2QweJKCNKjZfqe5M8wMgdwIPx4mH792LR7eiXRoBpjTs8ih
	RuYTgnH9ntd3pcLAwNaUTrb27xestr9YbVjwwbrujbX7g2HL7bWHPq2O7S6smLck7LQC1FJR3zL
	htC7s2oXphj49+ebhsuioHBG4L7cG+NgcrmbrENxykyHgopUUOJJuIL0ZkM+UKbU=
X-Gm-Gg: AfdE7cnEywMd7Mx0F4xswkToeX6Dw46MoUu4cPSlSjqtFA0ytpJ/B6u7Gb1I6NPttxp
	fJPTJXSiakctNa/DxiBcA0bkFr1tPq9gfOlo1B0aOjWt6MSfBSusTtmTLhTz4kj+09DplN6iPsw
	cOAUY7UD7TozAUVjoGAosvc65N+n/bJTWICvsZIsmUvY8euGZ+9jIw9oQEbXIyD1ZcyBuh947Nr
	NR50mYj4O9WeVbouYSxqt6TydLGqv07cwYZE1IMt7yJOuljLeEAq+eXyI0hAmuBVyQSAkRUfC7F
	A1erK5paW8Q4AhixFX8q5Yzef0XiyO02sf8eteDqDw51alg6yJzk0zBYVvJzQQ4lGuYEHzFGjVa
	D0QwthqXNuiWgD+EZOA/qVp8tH2q3/VJp+fw=
X-Received: by 2002:a05:620a:c47:b0:915:fad5:9096 with SMTP id af79cd13be357-92ef2c63c94mr972080985a.7.1784011173636;
        Mon, 13 Jul 2026 23:39:33 -0700 (PDT)
X-Received: by 2002:a05:620a:c47:b0:915:fad5:9096 with SMTP id af79cd13be357-92ef2c63c94mr972079885a.7.1784011173242;
        Mon, 13 Jul 2026 23:39:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15edfcdb9dsm722235066b.61.2026.07.13.23.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:39:32 -0700 (PDT)
Message-ID: <95b5ecff-eb84-4f06-a375-7a76527d5641@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 08:39:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-glymur: Add const qualifier for
 driver_data & CBCRs list
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-glymur_camcc_const_fixes-v1-1-c635123ebbeb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-glymur_camcc_const_fixes-v1-1-c635123ebbeb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RZKri0JlZt03aYT5RnQ5z2ciK4e35NR5
X-Proofpoint-ORIG-GUID: RZKri0JlZt03aYT5RnQ5z2ciK4e35NR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2NyBTYWx0ZWRfXwhuz0BU4VVMG
 IYjzMWZh08w42rqKVQvjt1FgNGl+ykojHHcLJQg9kI44JTvefguJjcmJT+pBhqnRvF8L0jlQV/P
 TSCZLKtaZw99d8Run/ixUFggm9MEfA6LpClLqGkND4UhCfvkkRzZu65ZMTIpE2rjjfzQNm8M+uP
 iKDsZ7faBKnCbvLVUTjCliAVv7H3NNTb9sf/cj4V/URD2+c0GuNb6uSMGmlGfQAnsl9BLaOAn2v
 rFwtule0Z1qrxY4fP4tptZUbn1wEjyu3QnZSxp+hSV8IeERFqTQ8kOETQ0wtNVDc9W7519pZtAy
 G1F0SaC7fbXOea/rmDXGFQ9ghqLNqNAy7usFy41ihk/MgOMbTeJaPp5UrzrHxJhNdh/5pz613I5
 YQopXJln/l53WfixA08yGbKMGvHxVNZevVTgcYhWsD4uQcLEf7zNrMNS06ApUHUS83XmudUiep0
 0FBktHdiL7pyvYwYYUA==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a55d9a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=N3WnDGiB_xMuMcIe1xsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2NyBTYWx0ZWRfX92x3kVfxgALk
 pg8VvLcAVU9RDkMdfQHFmA+RwkY9x2qVCUWHbjxeVMf7izkhwRghw69rmU0SJZ84pElnvjMnDZD
 pXh6IpQ1t0o7bjRKVjvi2A0vhd0Ray8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140067

On 7/14/26 7:29 AM, Jagadeesh Kona wrote:
> The qcom_cc_driver_data and critical CBCRs list are never modified by
> common code and are expected to be const. Hence add const qualifier for
> these fields.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
