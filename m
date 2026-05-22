Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27DB3793A5
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452084; cv=none; b=hAsShZ/fIMVz1pNWEmpNXwUIN78YL1e1PoXX4N6VgQaVgxdEFn3v2+v2jJ5eThjwH4S9qLm+TZ5PrI/Eoxgj3u4A8nP/hJzJ3c7iMYbBP/fjqoP066jCoC6C91Xk3Wg3RquCqfPhqkDeJm+woQVAvyWvOPfKGph+h91swDoCVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452084; c=relaxed/simple;
	bh=BoewX65LG8Pdfndl1vDtiqts2qaJrLH8LBPXD1duB8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGegxwj/X1bESnq84lxG0bchpf6VXnl5eFerF8K3ZcF9wIvekKJV8ocnj4+c9SOoL6+iZbHLKdLql2i4uSv2x5jEWvwlOe8VQ33bApswR7qpxs5U8D3kwy+4Hi2RvS27uaglJDexQiulND6cGVvdZZhCnFXhQr/GM1rLTetZ4Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FugQIAt0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AT0CMmra; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FugQIAt0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AT0CMmra"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8nrKw3005260
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 12:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=; b=FugQIAt0Y0vZOnpn
	3T4xrzy0T2ZCd59gvPtKOItV3Z6562kZxq6ne01WslIBDaqAwycNCG+jBxqLG3fD
	76TRkOJ7WqqH/W8YxcNQ9jyci2SYoO0DDv356X80oj6MAoAiBLco0NwYRdkm5TEH
	Mxt6oUoE2ZdQi85xeRce42m36z0uJEJztVeNOjRYlWWk0+7FxW7wUAovxXm5LmoL
	y1vwJe/xPBlAeplVlRb8Nn5jiHZBIjZsvA1rnWLxUQViUUu+mHM8hoKaPo5Hri+1
	1w9mNh1G2rqFbOE++tWXIQBVfo9wj2WO5agXSJ72Jw7exjsuR1CX75tkvtXtVmb0
	xPU+yA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt9vwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 12:14:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so173671985a.0
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 05:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779452081; x=1780056881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=;
        b=AT0CMmra04gdQS7TxPA2TwODQeE+eEjKn3n/pccRmJXWHN8ifSEAgznU3t5ZLpV9qp
         K+H2QGLFOPfxNLg5Vai0PV6eEvgrOphRn4nhs3ttUW63mikqjFOmmg++vgz/H7SfXDFF
         iaZRB78MTWfvLQw4U94T8ObQIY5m+YvPeHTX0NKK/PbCyhiZuAuPDlAEUN5ymqdGj1vM
         w4MX+ieVTLSTkqCBTHyFBpgG4khz/ijEh5SdswLfleNE6FQYJ37L515Vk8mR9b9zlMTW
         OXPAxVhFhC4JA7Rk1kH3hYivmUjoYQzpRUkc5GnD1Q3iwGqkBXEogIdVrUOuN6+aghrL
         ksBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779452081; x=1780056881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=;
        b=I0fqk5hKZ/giicqNgVyPXoXV/NtGZ/4XxiN1uLMwixR5dICqxx+gaxxrnCKQ2d6oWc
         XBgoRuqw1jH4nhNu7MRqUS2sXnNgSHf+DPN8RyP9X2p950oudD3fM9IY/2sFmgiWrgl4
         sEa0oq744Fv85tmedn9IZD8TMAnUMC2flsONyqvSLPt6HgsFiG5D9ME+RWBYH9pnqVyZ
         3WHyv2SBk+80CaJGD39xG7b1hp4pc+nSONMv/AZXQ2aZw98L5b6RgxDhFZEcBVAVLhAc
         6IKntw+rx+1rGP9UtVNmrVp+43OtYghbVXhKkPknw9wQyGtUHHwDsOESIOHyE6BEHmOe
         ez4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+U8Y74HTAtzMAbHxVb2JN7hRD3jgvTq0jT41amEvICpAAUwqxs4mzK8B5OFzAXbW7vdmfbCii+ATI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjJx9vt9z4Gelf1GFG9C13eyGCP+B4V76+nIhSt1XRrPKfy0Na
	g1OH+/JSU3jGHM9htU+JDgZovRNA0JgcUBfE7GGcC2TC+nrfPHdY+Lh/TJ9cwGewnVhJpXiyCpQ
	U0ruv9f7OcESTASL6zksT+n0kqyzIuE7fsuIjyPhJPAT+kVouS0kvA7A9Nu8NVfw=
X-Gm-Gg: Acq92OGvxnMEK92NEqIs614EICK6P+fMNaBxTAR0iv/E/ZgXmvzB93m4MGgP7Xd4JPw
	89AwDdnu8J5/eJuGt76iOxEsoDYFbqRS+liF1XbEthLH/oOCmt7LJy2cbid66coyw9Y/OYuZlTq
	nBEnxaXS0UdWqKoo4YHV4+rXyOjktHLGp/uGjIvcz3EQ2xwnufcbGAdaCe3VoldZaNnDLyL9RoB
	wjA53MiJstIaUtEHT1RhMQOXCBgH4ujpXkasnSylrzYxW/5EMfleIKCXCMSSIbrB/4/tQqLjI7s
	TfXsidXf+d5ub8kFTyvzTQa54vgcA8qq5lCxT7V1g1Igh2NOaJ2hjbfFxESgI6xbFNd9IvFs7Dn
	I+LikAaqlznynSCaYQ67bzqG2hTGS0bv+2EhPIjlfvYNSsw==
X-Received: by 2002:a05:620a:2985:b0:914:aa0d:aa79 with SMTP id af79cd13be357-914b4a2ac9cmr338174785a.6.1779452080916;
        Fri, 22 May 2026 05:14:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:914:aa0d:aa79 with SMTP id af79cd13be357-914b4a2ac9cmr338170285a.6.1779452080513;
        Fri, 22 May 2026 05:14:40 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd5bsm50436466b.5.2026.05.22.05.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:14:39 -0700 (PDT)
Message-ID: <5f5950f1-397b-4a7e-b88f-b6b74388e310@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:14:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm6115: add venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-3-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-3-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a1048b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=N9Plf5D_esIoL16y4e0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMiBTYWx0ZWRfX8LkSwS6OAbpj
 OZhO4A+xwqM7Ju5RY+2wCzUqQxHEEEpdjaSO960yB7ZvdLnUT3sVzgoP/hg2dkjnJLo70jgCB+e
 C40KGoVI0+lu1rWqNsQmQp7mvEAUajTPuB3uggCTwEIX0XDRJMEj0ke/kTqJrLjxf5phSfFn94T
 FKqhqiMCiweUio69/IlvDfDrstaDCzk9514HvHWECULZBOOaA3p9aavBIb0jpRnRwvm2V7nRdZF
 NYt4RZGHDBGadRiTKibVQuE0KNdnZYyCgC2ArnTqi0JxHr33jW7QlCecIUCj/mEQbTnsZSX8y1t
 WiJgp+ABil7fFX25n4y3ZFe+RvkFU2I42WDnvd88u+xEnJEyc9dupIPm595F33UrXL3KVpZeRD+
 M7z9ONeHh0g3eRLFuWm82rjab3LBOhi5JwzNo0deseUTUhoJbewbzzWbBeakcq8jiTpsiJ4Uj5B
 dCv/jWZsncPGzhWufkw==
X-Proofpoint-GUID: WUeVq2gnSizQsk-mBCNmrXz-7hSA2XBw
X-Proofpoint-ORIG-GUID: WUeVq2gnSizQsk-mBCNmrXz-7hSA2XBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220122

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> Define the video en/decoding device present on the SM6115 platform. The
> core, AR50LT, is mostly compatible with the one present on the Agatti
> devices, so it uses qcom,qcm2290-venus as a fallback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
