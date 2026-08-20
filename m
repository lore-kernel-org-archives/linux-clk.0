Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710F8415B6A
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221803; cv=none; b=vGhUvI8mbzmFTOwTjRGALFqjH/qHalhep7kXYM4qrxUEsUSZF3lOY8jqa5lXD58UkJf0u5aoIH4oHMfQdE123+1SB//p8HDgDQCKu4h+VYr0M6Qbq8DBQz16iPN1966y3Om7QmwNGlMvxPNr6nrx1RLSlWSgkx5p3rMSXbxl1Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221803; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEL9XgogbVMINFTBAHVMjazou9wrfPBiQExyzbkNi3spHZkNS4TCuFBFXm6SJ7cKgVf8YAuC1fy/gmfePada2k7tH5rjMMsPvrMQzE+5xaiF1I2Myziszy19QTrQSP9UWEbznvJSQrWGJYXc/EXepnQBcbrSLh0nfj8GEk+rWoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhWSbK91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=espK72Pz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhWSbK91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="espK72Pz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K9JAWK2927081
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=QhWSbK91Jc3QY0x9
	dy0u6vz8/qStJ0MzEEXyFP+iBIduKgim/IRnptMcDCkAckhal8Y+zItLYxXhzORU
	eD2Dy5KnW4R6DO4PZHuyxFz/kkPs0/P1SV4ArmhxOxOaC/ExN72eDBw35XSj4rcn
	rT40Az0XVOhPi71eVGneCIe/I3ApEHCtLPfnIckaig/O3o4pLT/vMvN2rteUueRx
	9P5zFVXSPHEzoucJ17ZrTSF2hIdK7uwlTFptQvnX/b10952QIgfyGBXHok1JDIIS
	D+TOMIPYmu2s0YMalGkmssdj2nzLBG/JX0l0eQccfLXA07dUrNsSloq1VgRKUMHa
	qwaKXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk099d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:30:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9310484c005so32754885a.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221800; x=1787826600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=espK72PzZ/rOc/qmmA7otFMZb+iocBCdYnwa+qtaTqppZ7nssNEZS4yMsuBDhvgg2v
         d4jo8EeE5p2Y6ApthaThWMQltTmZKeG+IFKXnuhttlKudjynFFGFxQFwqHOshMfoI4RS
         c6GUauIvXRvMCXXKTBUxBa3oJhYTCID7hj+o/7G+amQ35p09dmA3YmbMBMJO+9ufU2aW
         f1xmPmvjH0feGZoTKklpeci58RF2F/sxzzHhePXWQ0XjzIGbIf1ySwdewMhNiygl5Mv2
         ASWCD/LIGGmpOOXtASYeNBO2MOo6b26s4PXhZ04Yqi4/Aa/9soKUMLNaYkX3f/ttjkkZ
         N5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221800; x=1787826600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=Bl8kV+TiJwg9r2+xR20MLKsLAB6AjBg78SX79pVShCpWsys/H2lxiQciaMIwXPut7z
         jiyyj6DsFLNXYUy6s49DYflfk6IyaIMyBa+cYc861ZzAEzZddJhApMNXTfm9Ubup1/cP
         yu65yHtd2mmCt2Wib7lMMHplrePJaFEtUhvnM7dLpt5VyPPII6DdUnSsqASN8RybIhNz
         bkwSElnR8tgXsju8sBWuSu7B8XXKIxOfJanizp0MrcQQR6V/N+nlitzikHvaQ9Bw/6RQ
         jPZxTgm7mPHmr13pfqA0jJD63TeX3HKO+9+fSeAkWwixfnzX+uIlMUtPW25hqzz9aCWl
         I2rA==
X-Forwarded-Encrypted: i=1; AHgh+RrtlfU73mu/cU017++glii0s/bUV0j5S93PYjt5ArjODv1IcfMX6cLrFYzNG6n7mEBne50hBMwtRVE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/zMQNQgvXsf5Nwtc4KWXkbFWDMFmmjMcR/9QAxYnav1XJi6bN
	jELWg7HwBzGHvT17q5aB6Svqy8T9ZYcoWiRbe86wKuZwG6r/9Elt7fJbDbFhSi4CwXfSUTXXhle
	Yu8Ck1sapKz7ZVMKKVnh5BWNGgtJfjAzN2ZbfaJ6InLmjkpvQJJ7NFm6HW9Uyxrk=
X-Gm-Gg: AR+sD11ZUtxz21vf41mWk6dEQ1rB6K6w38B/q3b0GMxSzzt041wWD8ng53dl5loK1S6
	8RtqxR+ib0rp7S/F9LPY8n7v+TxMsRP2Dx5MA5phSYNGxBYBhEY75cJpc7jD2rKp2qpbgX8Z67m
	oWw6APGFZPbzGX5PAuho92/8lbEJz1KQr7hN+7tjVIls6PchfV7kJH1R0Za7ZkCJuvjZd3TTmnO
	T8WY99kMavxgdFHq/fLjgBWC4CpLnuT9sCtZ2j8lki4EfM/urh2b6RGCq17j2KaXoVzo9h5E5G0
	n6jmdVrgb14qizvwJrueGt8NhgIRtISonfDkls55CZ/pc5GZVifgaxrCeLiZqhMs7T65OD41TYd
	m++4imDyUp+Tu2qlZg9Jdl+VQ
X-Received: by 2002:a05:620a:640b:b0:930:f930:a09f with SMTP id af79cd13be357-9371e2ff3fbmr757254385a.1.1787221799873;
        Thu, 20 Aug 2026 03:29:59 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:930:f930:a09f with SMTP id af79cd13be357-9371e2ff3fbmr757251085a.1.1787221799477;
        Thu, 20 Aug 2026 03:29:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm52452666b.2.2026.08.20.03.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:29:58 -0700 (PDT)
Message-ID: <723eb4f0-aa97-42a8-a534-8028aef1ce58@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:29:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/16] clk: qcom: gcc-sm8550: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-4-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-4-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0Xz-B3V2GktNlLsNlFnUOpdYn2kTPCAL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfXxruhLbrR9oDi
 hFhZ3azzfkjiBFUuu4OAZVtkA+ofQl8MBidDhJgJlQW39QwKlpYvVv/Sb0b16r9ZxNpYvuT0Ga0
 b05opIuW0Jek86msQ7OuZTZeON0yAcg=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a86d728 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX3bHf3cBmnfqP
 zWrhmBG/65Wd3XcBsYeUBaJ2tZNtaeFPGici6OT8+XXPKtm/ln6ALuVIUGRQPzTs8hElItI4V+M
 1KWcsmkdi01osYkKfG+7lXWLfLsJTtw2t4NPMACz2UIBYQ3PcNziZGIG4t3s+d6nj7nyHnK/dXn
 YaVWyDVb+cvmWZkZPPNi3IKWKlYlrZNQVzpmKeEWqNdt9ZEfXy3MSJ6ySR4eSaGik02WOWqvjZf
 g1KWP4u6/Yot0DuWfhHb/lkNzlFVXeWbzeShZSg05Mc0xZpLASs78rjTA/41SBG9ycgXQA2hC34
 A5Yx2owoaVbXZ3n9oeVb//3HYWsU12JuZ7zTNb//1PQ7qmo9jGOhTLcCl1Wob9Ndl2yW0aiB7T/
 blhhwzA2tGmNnD3LiJ2SfOPnSMVUjYvDiip4Wq9Qb0aFyXrLUAi3vTh1h6bTOyulVUuK7mAqS3x
 FzurKmueZSLuHitiCAA==
X-Proofpoint-ORIG-GUID: 0Xz-B3V2GktNlLsNlFnUOpdYn2kTPCAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
