Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5181C2324
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 17:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150694; cv=none; b=AY1JQUrRWyAUemWfm9ltdR7BvzXdIzpV9uDoAair0zW22C0HKAmo8NX1qNR2aEzI8IIRGZKMv6uqkPa5K/qJUqzlrJuEvOPtTxTl7Fm2pIRegyqp0AsaEnA0jWU5NWGVGO/UAp8fNM/hf3wE2UHXvlwfW6dN/574RNMfuIUQwqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150694; c=relaxed/simple;
	bh=rU66pNh3eSQsYT3HOOaM/C4NT969liCxZxRQ7WDslT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czCkfnmbMjtaNlXA9TBu7npXjVuZ37bEHF8NNP7+jHGa55c6ckgXkVf+l+RrNfrPsR+6G5m5A45IqLmpuIduiUaRhFzhkZ66NyoNMRiS0aJMD6JlVchBcrEn8zYXXc5EhOYdaFdUgEv4bgRxnZgVfaLZq/KRUKkbTYWWMA1DCeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OO9HTXEO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6XXPEP3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OO9HTXEO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6XXPEP3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFVoAP3842519
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 17:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dLP+TVO4tZ92+I0qsy0dTT+zkkqGwfMz4MJYSPYxO4=; b=OO9HTXEOxIEIIcYC
	kf514nYXGtehIG9U2CEeACRC2QsKKZfA1CwRVO+RSPzeFihmrbTnnuFx0URXowBa
	TW3tspECGsqsNkKoW+XkUO2hu/iiHusICluQpKqEuQoSInG+aGV8iTz9vabvaYUj
	lGfkil2VlDGS1EKwJd6cV05WZ+wBT+9rwRalKqwir9NSOYnXyy8BWUbiVRiHWJjA
	IvXd6uzCWbtyKTthHzn9zgjK4gpOaYRmLGLtFihfltSToI2mGzsK9MfCQzYqPq48
	nGlOKp5CxvUWHPtvTZ3UnMoYan4i8rs2QgKPy7KXaRuFERMt8gMGlPGCTGy8FDy2
	Dxp8rw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhsnx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 17:51:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f6247c6so5594327b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782150692; x=1782755492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dLP+TVO4tZ92+I0qsy0dTT+zkkqGwfMz4MJYSPYxO4=;
        b=O6XXPEP3uX4e7eXteiV10Y+subYEonpYsTY2vzvkg9/lQtKnynhsljqb63y0lYfu6e
         kfZli2dAfGYw2iHW9DqHUQO4Pb3QtytpB15mt+RiWq45vVao3PTV1J7LdGQ2iZrldw0v
         k29qb4BA8cW+BXN0GG2CLWejLSPTJrFcQmbnGzQYaZxsaJIvWzHSI9ezZmPr4U8Yvy6P
         xUaKiiLou4ZqCXnwf8o6RjDZt0vXHBSVY//uQPvtwMBMVMwCHCuk0J7/BCWUi1LL0B1D
         wMDNxlXmt//ITEz6QHbjIpuEtXbLT67qHvbRs/9iGh7bpmV3H8hQG4eJTnK7iPWMSaRN
         Gi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782150692; x=1782755492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dLP+TVO4tZ92+I0qsy0dTT+zkkqGwfMz4MJYSPYxO4=;
        b=N95eUh4E29qe2sWa8gpOyjIgXMrxXqviFvvEOase90d3Q9nmnZVnTieF5lZZUbVOh1
         iFFe0sgzsAe8t4pNW5H+gr6JSHU9PfxoecHUHfOFClDkO6tJWTKqTbFA6001VjW0c7Wn
         E1bOW5i0nltMFoGn0Q9e1czSu0sy1bbEm3QraxYoerAsQD+P5BgnO6pStcYc+A097IKc
         5I8VuVcGJLyJWTNjIKISlCHsGUfudq4DMTxwtw/POrFHQ744RrHSykKQvXsYz6zduCAQ
         AfkBx+lZBChSjOoMqtbZOVqrRWi/nw7cei5scPZf9zzBYcAnvOMqau8JTJTwAX3j2mLD
         c2eg==
X-Forwarded-Encrypted: i=1; AFNElJ/MzoeMucrxcZJwSXoPY+w6SdfJECRKVDgLyBitTqvIQc/NgtB6Yht4Zg+My674N1ly/xLtrvgusHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJFDC29i8iCC1dSWpHtqSnJH7/Nf95Z2piHyLOTIAx62zYM8B7
	NQIkMxwU8hmTQSzgtv+08fXnJfWQc1lZC3c+wpDNZL/Lq8Efqkfbefssd0dZNDXhUysuzwcBS4r
	mKrToQEEiLgveWP62vvNn6R/qpsxYrMK85q2KZthYQR6H51PNvW3xCpnPlFlxYe8=
X-Gm-Gg: AfdE7clVJBlnP8CHunxVvyE3FIhMMLxtIKlieBCXrIRHnhUO2RKPlVo2fo27gxR58Hk
	T95AXxC9mg9VeTV4VhO5jtwnDsaG5J4osetB0gx3Q9+CtUNSHDs9DfuS5F/bCrbjSQ1XCwG/Hw1
	f6Ox6XJ3arwuTOGbddQKY/GCxILC7bhzKbikHbhrYe9PBS386S12NQB9BjY1kAookHjbOPPm3Gs
	3IrGNL9Gbj2U6gT1qBr0gkQL6oZCzAnDq6mQgBD3uMqTlO/F9+gqIXEGvOwJSz9O77ks+9pSD4w
	4x/S6d8eedRiCzAGm00MnAwwO9Qlgt4Ki/glMSucP3AeAsgTnKrixa/yDWyf4auKHGmbD04xF5y
	5BA1I1Gf+oNWrI9AOKu7lCdZkVbhZs2sX78NCv5M=
X-Received: by 2002:a05:6a00:2789:b0:842:6fec:1297 with SMTP id d2e1a72fcca58-8455078a336mr15737990b3a.9.1782150692323;
        Mon, 22 Jun 2026 10:51:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2789:b0:842:6fec:1297 with SMTP id d2e1a72fcca58-8455078a336mr15737963b3a.9.1782150691759;
        Mon, 22 Jun 2026 10:51:31 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d89dd8sm8300360b3a.15.2026.06.22.10.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 10:51:31 -0700 (PDT)
Message-ID: <23e910f0-f996-49b4-9ba8-5acc3bef2172@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 23:20:56 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
 <amL4e4IHe75_j1HTIsmqE_GyurvudlyHQCPW14zs7ivHz0UnalN-yoknJwzaVRgHTT6ftSRCqDyCodh6ABCLxw==@protonmail.internalid>
 <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
 <639c94f9-6f62-4502-ad7e-5ae60f5f6d02@kernel.org>
 <WdjOMNZ2o-UF6xXKW4LiVgNZB10ZaGze3YWNriL-f1jf7LgBzprN9bqqMYcvMJH8KUF5wtRpyOB0aL_7HEk-yA==@protonmail.internalid>
 <10c2e008-74fe-4dac-99bf-194a1767bc16@oss.qualcomm.com>
 <1de2f9bf-b48c-4acb-882c-9e35a8582d0b@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <1de2f9bf-b48c-4acb-882c-9e35a8582d0b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE3NCBTYWx0ZWRfX2YQqTB5CtCDz
 90VBfF+ZZ4TWIXoC5Im6ewQuNRW0iGJhdlzhr/feHFhlcLXZlJbC5vzuvv45bY2EvPaHGe2SCM4
 NC+/E45osn3+jEMsr+tB4G7GtdBa/lE=
X-Proofpoint-ORIG-GUID: YLqYKHdvdko88GabSaJOWZF8ZWlYi5yj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE3NCBTYWx0ZWRfX/zi3DbDVYd4S
 DmlOfxl7OhUm20iQ2fVpyuORVjpSa+KWcWBlZpxIhFU1VYZcIm8w2tooVIU9IRqKBxs4pMctvK2
 WmLroy09a2fh/DH42GhG5PC4DxcyRxyC6FjHWcdsxICuiR1lg5kgMm5mv2nFiTFmlPfM+LesvAs
 jv2iZAbDUqymRU/2ihB+2GjRzk9DFciFe7rhZxQu0co4aKLib4Zjs69jWocvYEEkPK3WStx3XaJ
 iHK7cEfG6za09sFxrUWEZjmwo/3fn309oz+vYZIPOzYOrgRW4exvp3Nqwafh3hZ8CaBZBUjKJlt
 OVby8s4xHPYVL1/ZIDOo9RvjfXcymbjZAXcEUL1jHa19Fg2VSW5BMUdPzpKItOLXOcD4YbkPdr+
 dAdakt3sx4qJ1nWY+k4t2GvA79NMahVrbWaFhxtC3LQdqjMq9kQfH9gsbWG/uF5+k5mCPEVJyrf
 oFK+BA2IpTen4uJhBCw==
X-Proofpoint-GUID: YLqYKHdvdko88GabSaJOWZF8ZWlYi5yj
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a397625 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=QCTWhj6wmzAtHfIuGYgeNA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=oDMe_2bG_2z3vvWk9CsA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220174



On 6/12/2026 4:44 PM, Bryan O'Donoghue wrote:
> That's an argument against changing the values, not naming the values.
> Hexwork in upstream code is a public black box and should be avoided
> where possible.
> 
> How about, take these fixed hex but someone on the clock-side in qcom
> agrees to update the script to write defined bitfields not hexwork in
> future deliveries. AFAIU its a script that mostly spits out these clock
> descriptors so, it should be possible to fix that script once @ source,
> without committing to fixing everything _currently_ in flight.


Thanks for the suggestion, Bryan. We should probably skip adding these
definitions because the approach just doesn't scale across our various
PLL architectures. The bitfields vary widely between different flavors
of alpha PLLs, and the SW driver doesn't interact with these fields
post-initialization anyway.

Even if we generate them through scripts, it provides no practical
benefit. The field names aren't meaningful to the end user, and the
software never decodes these bits at any stage beyond the core PLL bits
we already have defined.

I recommend leaving them as simple fixed hex values. This keeps the code
straightforward and perfectly aligns with the format our hardware team
uses to pass these values to us.

-- 
Thanks,
Taniya Das

