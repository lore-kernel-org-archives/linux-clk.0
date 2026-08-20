Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9783D7D9B
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221786; cv=none; b=nuSxVocgHYZ3y0rUbJb1tiBenfNt1rxnnsHTz3HQ/zgSl5WOWVGFeGi7rs3PGMFjqKCOrIDnp/P86Wxf95llOWUUp8uY3fSIFdehu4mGYvP/dMPmTnJi39gnAhZPi9u4/rkfjUXi8nlBXmx/pEB56f6uTy0iedt8Zt7IF17TFbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221786; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFOKgpZ9SF0VVIIIH9Btfy1ovS9qaDUSaf/cUGBO8GeBisAd2bEkDsLOaGd+Aeh38115Ec65M89yjsz6hnb4rmHau0lZpY9gPt8QnyPdaMJRdaoTwUqS7f64YNCISICa09t3xaOvYvIWZgBL1WHa7mgB9ObE6z/VoTO4AtTMleA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpZBWo0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPxyJu1A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpZBWo0P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPxyJu1A"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8KiWZ1680581
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=DpZBWo0P6nm4tfds
	UU9baKjzzEiiarXCl6W3oHfDnpasoJEweOrfPb5JuSKOBcZ2fS9ZBnIkcxCGgb3C
	K12xMfTlcnd1KpymL8/+20QbYrkGxdr/K6mdjSqV8OWWvdn3TTSkZ71eEOl+N+Pn
	LwzyHmWslzOk/r4RsZns6THivYqj2nE3qS4XyqaMcFiEq3yi6gCb6xoM5FKUCLQ8
	vy8oUuGgOwmH7fqeFcg8EV4dpGKJO735RlPGvvxcmNXNQkY1MGtROe4bTv055PbR
	M/Dl2DSyeBy+I4tkxIIsGpBA7wQl7uZb6KFTR/u1c9AphXLf1TljGu/4y2WvyNyN
	lNf33w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05rgac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:29:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9310484c005so32751785a.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221783; x=1787826583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=NPxyJu1ApqlXETDzfpnLxrgJ/hTkiRzTgvA2Q/7uslpuaVLc0v4YhT2w7Q0quVhYU8
         2zsGudo5M8UcfnGmHbhDCVIDAliDURBHPdLorlg6Qn9Ndgl+nr6BlJaArfTCT+fMr7xu
         FdQwgH1jPsH0guj3Z4NzC6kUEvBuI++lCXeFeQoRX6TS4w10vc/QEIfij3S1/bfnYxTI
         qPU5l7lP1VPaLAzTJWesAaW3TDhk3WYZACfhA41EccsuoixjhA2yjSmF3z5hkDmQ0Fgx
         l1TKPEax6kFGIAtwxXPvc0zca96pTDABWam5Ow6ip7gfyjM66CFnKKoit2qMMd5cy2lp
         f2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221783; x=1787826583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=KPW7JEQjTqv2oK+8lD4AxqCg4DOY78R0pVMTRC7b7bSnqXT3Vhw+RkKhnVA8bbQiUt
         45/FpNYjEAbV8cG9KVYfJ0tJPTQFibO9pyyhhzgf7cnP/XUDI+h1b6l0i7kIX22q3x/p
         /0+2FvCzow+oEhHkBLvOrI8WwrkOAWtX1HYndC8xD6lMxyL+JoHxv2A/CRptWQ/pq4qe
         xbwURooSN9T6/L87BjfWocTBbSQRPD5gdD5HoN11P0rSLYm1Uj+h5s0Bd4ryjdr3P59k
         EhthKlvc9JoGjEkUp3G0bRo0VZfdvUp/JOxYfm21fPEVvgLXa949EnVg1yQLvWsePPfZ
         toow==
X-Forwarded-Encrypted: i=1; AHgh+RpLBCVBxUMxALlkcRjp8gme+YPdCB5c5hQuoKcyIegbS/RZmOx2qZt7UGd+WxFad1gkT8LsVZbwgMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YziUtaQ3t3KwE/KhqXpx/jxbQAgWvE621NOIcXAJ4DS8LNTBfVQ
	vcmMI7IW9BPwPqqXYaz3wqqrLJIHajDYkbkWOm5XMtjXf4HsT3FroiimflP9xSwMo9oH1Wz+7/p
	6BtAnkVOJWRTv6Y1vzYGQAd46+CQ2G/je6p6iEYt1pXjoySh22cbYmGx72H7O310=
X-Gm-Gg: AR+sD13Nm3iZ+X0WrgFw8+MaRNDKd2xOTg3pQ+MszvRORlHbw9sU3cL4CRbeWXgwFxx
	UmGArbIRJylxmEdma+qyyVSjWr7iX4DyJy5L1UqvV9vGefEj1t6EzlbuN84yCHaHLUsCKe/kduv
	ejblS2LveFeifbRRXAY+aELJzNQUEHB4ChiQqboHgGqPPsr+/4UBvtszqGIezhcAaxny6rJU+pH
	BeSUfUxNf9UbCFCfhZSeMsuF0Xh2FBTt8Ms8/6WZS+BId03l118U8s0NoncjrwPHE+oAp8+AlU4
	A+0P2s1A6degkIIrgGnrMbsK3nkY4RWm7MdFMUdPlE3Rl8+/cXgWKm+1EP37QAlN8XowYlGZ1XL
	R1iG+SJZWb9iXKtIRX/kjR7XW
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr728474885a.3.1787221783591;
        Thu, 20 Aug 2026 03:29:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr728471585a.3.1787221783120;
        Thu, 20 Aug 2026 03:29:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm52452666b.2.2026.08.20.03.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:29:42 -0700 (PDT)
Message-ID: <30a9027f-f565-4c53-b1a5-137f63f2fe81@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:29:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain
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
 <20260820-qcom-tie-cx-to-gcc-v2-1-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-1-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c975mdttNYdovuAFRg7q16DPKCi7SkT7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX9qVImjhzGZ4+
 eodsyoUy4cN717i6UrGYgu/9QT8n6I/tU6eMl9LsHHe6DRm3ixJ/3htac0w2v1TazcS2lk1gw+Y
 IdrxGoHiHGWaPNfNgX6a/BR8I1heRonNCpFsVb8P8DVY+4ItAsVTZSV81TCqQjqnADu+CslG+DQ
 awr//AAt9Rc340OzsBnsaiERvHdUNVYlHe6E5TIorJKGyAdqymwL+Mr2LNKesiHryuIKO1IyN8D
 vRyL6gzukngsKMVPH04HIVVMZavQkHH4ehLpPrRkoj+4Od6K3eouahDNXXMSXWy1EGFe+835x/1
 GdlpNd1axAOcjSjlqQeIA/88TZ0FDdPicgETtmIFiYh8e16VHoDPxtMcY8IG90ZbvscHoSVCRRM
 Rbo69SvoTELV9Lp1kYoOMl4nc7yxFOSbUbitQvJxcYn1EtCCQuDXV6OPwof28cuQe7k9Dkf2zZJ
 ixNNZZyFn7irU5L7YEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX4SsglMFQCb0n
 vhm5fLyfOZxHfzb7+jdgN3/UixGz+7D4hfTEqlK6CYs5ppR3qqpDMW2jXTbqvQy8guJUWgoTNVN
 04TaJhDms5ykhxn319bIaC7mLzsqIeY=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a86d718 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: c975mdttNYdovuAFRg7q16DPKCi7SkT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
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
