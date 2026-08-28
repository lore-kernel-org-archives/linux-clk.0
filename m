Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3F936F916
	for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908519; cv=none; b=gUbAlHxQ9aObeZfXayxaDYJ0oGf9tAHCzRir/gYBhIAwoMF6Vym67y12jY3zS8e8ihUYZHFdIv2ys/v+qs1YbPeX1plk2POATAGYgo3FPHLzsCQ9YJkdUPRwBFvf/w1EuYaf0Zi+iGuU/QL4lWIAsMDJsPW7wOTZ7J320E/LsSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908519; c=relaxed/simple;
	bh=vkx2guBaMzaA5PGQ2NLjd4JukbsB134nwJuWbFJQBY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IT+Xti/0MNTEVpZp418VCrN9WILHig2Z4kCy3MyVoh0PIHzV6d2qSOf+cSG23GDd31X/dfqsIrWI8/rZIqBn9AYP9PIfXOkOrbrsVhvj9ZgDr1naR/fvmiOnUZQxp0l6Bji6Y0lZmPhuRwId5VyyNXqiu3ioDMr5+1Ooh2IIc1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ckshq5me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BczzbjHe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ckshq5me";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BczzbjHe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66ZYI1520544
	for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2026 09:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mTq9qZkiHNAUCuhtPBLQ9No7
	1OhjJ39In02KZH8YzSY=; b=Ckshq5meY0rWOIvb9Roe7WYDfSaKDUungroIaNay
	PLjhl5bBc31Vl8JnoplOW5oxYtHDKyvGUuMeDOgvtb0Sl78ae7CA/dA/k2JeCgE5
	jv1wGU99pA/IsOrknecCkcwOb2THulUi8I5St76XmG+oW6cFKkzXyjpuCXVF6+FC
	GC7DHowpnmgGPpgTyrrxpvK8uAQBcK+UDMznH/GSwv5oEZXmgmJ+17OPD9/dHwXI
	8aBIpzKZDxYCUmyjw5fIrvo384rQc9SGILuI9svJGJlGt3vzCueuBcjJd69EXldK
	oNVrVxXu05wbtLLH/pYACw36c931+Wu6+I3uCO4zq137/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu8ysj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2026 09:15:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e934385db1so8553346d6.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2026 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787908516; x=1788513316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mTq9qZkiHNAUCuhtPBLQ9No71OhjJ39In02KZH8YzSY=;
        b=BczzbjHejRI+f3oDDcU46mNWOKek1xB97FzxmOCKKmOf1OQTqLnjET5t+7Xea7dNXu
         g8uxt/4c0BE+G6PghWdGTK5T8slpeWWrB5PEUJPu8DvueIgEVj4L2h5Dxmo2nDNIcHyz
         l1NpRN1WsMu69tXreUN0cn8H04ynvGiRMrh4mPWa8+nSkaHlBQbTo/VEJU+1UwaWVACw
         inQvF6tZUIaKUylvdhBVWlEWWPaVEtXHWdZkS5svOuxN8VEy3HPIeo/kg5n8rrXKZ/kz
         yLkjTpabrvEQDRay2HIMF/0Q31FCvW52H0PjTh0hlFEYjF5hAdzR9sG99zXrYPsjvrdg
         RtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908516; x=1788513316;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTq9qZkiHNAUCuhtPBLQ9No71OhjJ39In02KZH8YzSY=;
        b=GEsdkQ1PbueBagcqFy5jX6Nh9gLR0Lp8gQ2t99LO59ZcRrlWwVfnw+T9ZT2HRGnr+a
         qCVc+HhBrslBvCYQFLimm4GKUG7XSuWjj8TluiSexzMRIAcAFYjdqc24ukkqn2pujDnv
         fQXSfUVCkGtlP8Zm5YqMshgg6x43GGv6+IseOQRT71IstWcJk4y4XjuUirFmh8Io1UzN
         cgW2jUHNqi6w8lmkvvFScJkynE3f/jk6X5Be9jzAwVGlHjzT6O6nzlNRlwiXxiREPioS
         sfstVa05tLcJ8Z22NcmjMydUMdeeb3NnnYsKe3FM/jMNopROMCtOQm7DKtCgg3Lcq/Xt
         d+uQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqplBNbPZXNlVohr8Uy5sorePG0zWkleNhp8l9k+mt63kC0zsyY9uu8dLC8jUGcDmvDmDUR2KntJU=@vger.kernel.org
X-Gm-Message-State: AFuF++lWTyBZxjRacH7dx+G86JaFmf0gR/bpV4T01OkdhompOG1DXaNm
	6/WypCB2QUh32Ha83wFpheqUyhHEHzVYmkHktrirGBbZc7FViAnRulnLDAlBcpKUXelhh5s+dpF
	f/GjvsRP2N05Di5nIgixSqYCqYMY7pGWqZclyIphll2APwfnYnWknC/WzMG6Ucmg=
X-Gm-Gg: AR+sD10/036/5p9tteZspS3JQ1xlLg4wNYblybgRKbGBlJ3Rg4mvBdpSt1ZYrvcBHs5
	0UNCIv+NqpIK3/V3CsD7+LcE6B9pls+GmkIA+r1O5dRkYgMfyP7MOlui9JwIdQvZYaX1oL4xB+F
	nmgMkG/PQVcper+VzCPJMQkY+dLFRTQFnU5YJZtV5sTRlBFGG15lLLK8pDnK6mS07vaYZqS1KHz
	2Uf8yezbU8D8DoEb2YZRSM7pC/N/1OxqVVVA79rgeWSvvxAZGhXUWr53KV091UJXRZO0lkYrr0+
	ZreYiUXOiffcwJv+tM8phL9ODU//iCoFHgO9aIGLFonft2/nms/Q0zyWUehcXdgJud7uqLieEry
	5ovA3RhUTHaErwA==
X-Received: by 2002:ac8:7f11:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52fb940f275mr60260281cf.16.1787908516009;
        Fri, 28 Aug 2026 02:15:16 -0700 (PDT)
X-Received: by 2002:ac8:7f11:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52fb940f275mr60259141cf.16.1787908515321;
        Fri, 28 Aug 2026 02:15:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b90f78244sm71091685e9.10.2026.08.28.02.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:15:13 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:15:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: hamoa: Drop unused #reset-cells
 from TCSR node
Message-ID: <oae6lszsj4ommijvol77a6vcfkbs6b5bhd63bhl4psqbuaze7u@ewetkfwppfoa>
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
 <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a9151a5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oAhxQwU1FG-qALgQiYoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: x8LPKTdByrJc6fuDw4TcJAgTYhnuahzV
X-Proofpoint-GUID: x8LPKTdByrJc6fuDw4TcJAgTYhnuahzV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3OCBTYWx0ZWRfX7MeJIa79QlzJ
 vZ7dMjIDrAX+DaSavPNUgG8aGz3hyFODQVOdDfh4oxvVkhOf+/eth4ApbS3JlNFqvzr3gTZaBup
 y+thjbyZj9rI9IR4Qzfgenpixh8CnVI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3OCBTYWx0ZWRfX8n3nkQje8yIP
 dM7CWoXIF/hJ+UjiTf3yL/mcoqqoMyeQNk1RFeZXCM0QqPbgkEbvclkq8bIvqo0tGwmXiWYMTYE
 yBa+vevLoRje5QhVUzVk4YHWzvuWlf1N1B4fJavErB35vRh9lv63tb6yTEOzBJbXcfNhYn1uHi8
 yV+4IM3MYK94JpsS4tJJlZ7KI3cnHWmUMJNzk681IWkYyB3YxRi5IKcN4EvadaswWKFwzJxjfs9
 6OF4vKEcXAKW4LabixxfHv+6K366+9ozykHRfSF0KKRMtkgopmo5Ia08cWKwyvi/VrlNy9xL4NK
 hYfKius+vGYXNv7R8wpvAmKjY5Oql4nvyaX9KGSKd4hf41e/pFJQ13o+0jQi8je15RWYf5CC8zi
 iwDVrndSYGzTtdarvcAG9FSgidyBOD5OvK7qExAu602YUaZGA4PcwLvQKe7dHUJIbE6vGk3Q4km
 MudRUbgWtOs4J9xsmdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280078

On 26-08-27 23:00:35, Qiang Yu wrote:
> TCSR does not act as a reset provider on x1e80100: the driver never
> registered a reset controller for it, and no consumer references
> &tcsr as a reset. Drop the stale #reset-cells property to match the
> qcom,x1e80100-tcsr binding, which no longer declares it either.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Assuming this doesn't break ABI ...

LGTM, otherwise:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
