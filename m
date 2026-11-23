Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461280;
	b=Qu1UCry1nb9oOF3h/DKI1V+ajtVhs3tI1lzitRReNKwLxxA2er68RATnxGot/tHrI24z
	 AnPni0UFul0qol7xeT6rd8PeP+Tt8431ZSFFiIzGK/Lv6ZDUnphGqOHIQLHLW0eYvpgxL
	 fj2cagKYB9csMPzqihwg5nlVLTu99x3yFiOYbdglQ3b5RX2wtZnKYmgJGRag4f5Oyx3tW
	 Jo32JZbGwh5rVjrFfNbfVUfiZ4yutTtcZa3XYUSH1qxz9QfB5o4yE4Ep8kHy57BpUIEl6
	 FARhIfvjK0FnxwBiENZlM8OIla7QIr8NfRlV+pxbirBi5Zyf2cow2646/J5csuqmemw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gS38KZJNFZ90HKGYbwLzukxI5ECwcquZsp/UfDpMK3Y=;
	b=NR8Jc1myNcSufLqqj0U9cAxpTQavBzFrsodhfPBm8pG7Jrt+AQBU5ovLTaUkseucv6q9
	 ovfZ22RAdmlv1EExhgzqDU3+C2MbsvZgu1QNM8wzFnkNhYcD7xGNf2765g8HrjQAhWi20
	 9Yjele6SrlO+01SptLL3EvspRPUMEecT40T/1QoREflUxs0Btq0zEsInNiWBMcYOjad98
	 ++pz5kLtWvg9ui7tfcsvUqwVHsMqzxihczOXS6nzfuxaQpyu8iEE8YuJ5Ii5z1ti4FgFf
	 ZCKzecQ1bcYqXqM5udeA2/lPegN2rNuzW9Q4S/JFeDo95v2l2YKfTpgrseRgqn78G4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jelOsaT4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPjnMqgJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8CE606A31F
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E8CE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jelOsaT4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPjnMqgJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxqp3730309
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gS38KZJNFZ90HKGYbwLzukxI
	5ECwcquZsp/UfDpMK3Y=; b=jelOsaT4+k3tFs7zutmo/m1M/Rc+fyYFWqb2lpJE
	7fBv3RWcNVFSWvDqNC8fqgzM1pbcUPZbU7KE5lwjgq56hJREKvIyIqda9cnGsf9I
	Dxc4gekx3N22swDh7fA9ErldGowDQWp4j72GtD8bJHe1BVYfGZdzqVnzbWXooozQ
	ZJmA+jgHSlHsFzdN4ee/uJpH98hwmULMF1gxYjCegLl/LU9Jpf+d2++edar9HIWQ
	r9LMlC0XIVb2624Bw1iB9xzMxOkQEKw8rUmzjyifOw5230cLHbi8CU4uV7ypBN76
	Tvuyu7MFXi8igQKseeBpNfA1JvAnQsCkNgQw1NuojrQTIA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd33af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:14:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-920fb8b9859so112886666d6.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461278; x=1796066078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gS38KZJNFZ90HKGYbwLzukxI5ECwcquZsp/UfDpMK3Y=;
        b=IPjnMqgJY4S3zRf+tpsd4tQs1+oCDoUGtGq3Z5VjSgLLu7BrW9/FwOoF0RnkczZbEr
         4lgfN8v+GHanMtMDOv7s1i3OKUk6HvClU6nOk+ldl2qOghAkBoif0w6Rm4HMCJFZBWgO
         U7Z05hAGeZw/q6dUb7oOwtAcS12ahxgCqb7Lq9q68Vqzw1Ssjp7779lojYpI44UJHiev
         Fjq+Gr/DNYaWqvkJjbBWQYyMR8EIEcZt6j2PRtZXrob1fjtzmk15yVJEMTpJVYPWa4FG
         IWyKZCpcWv0LhO8GS0YxTw67c7UnE8+HWevbDsQjPmpPyniImdUJN4wSWjSO+qrzo+UU
         HiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461278; x=1796066078;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gS38KZJNFZ90HKGYbwLzukxI5ECwcquZsp/UfDpMK3Y=;
        b=cO+Oiwhtb0pA5XvErXu9D328bxBojWa0sN/YB8mckN5fxHmIR6+erWq5YU2v71Md8O
         z0YRvSyrKqSRYDj9+YIl9RGQ36LbpGwVambeaFKJuceFdsDda0NSTMxBhD3flNOOtIN5
         w2IbvAjz2l/4Iy01M4QwieGwEwdqRC+gsnVxf7+K8vg98csiqxp+mPldQFWoA1qDY16C
         u1u1d6KrhctmgSkERK9n1TVPbZKXA41oOWdZCAO11KOvOhlZs9ht6ZK3OvAV0EsUJ37m
         s3zJudWXYk7wIw3omlvgheI8FqsDdcCZJBrw6HPSfdfieIxKFEglAFa4DDtfYdPMx7j9
         KJyA==
X-Forwarded-Encrypted: i=1; AL+hErFUUumrXiSjgEsCXVHQyyf49NwyYZmrdpcRselpA0hp+KitDSo8ylJsS1xo+3hxicM0toaMBmBLyxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bEoa4QX6M0Xm6QnGOkKPmHkxSw1aYfCbNk9UjZYoYS8mQgj4s
	9sO/yue3WsElpeNaloJVlUdmjywMCH/Mtu9S0AlEjQ+mbsvE8KXtrJY0zRSNjAhUITZWHGGUHDC
	MN+yH8fpZZnPo8u050q4uy6ZsUvcnlCryJ9vJGwP8afhUVvwFZP/McnK0/KUf8XY=
X-Gm-Gg: AZFdTZcHT7EvcMZq+is2OpMmlQpD3FrGE9ueL7/Ca4raAD7hZJ3Kg/YuLFj4totaD0z
	g6IW9/EQg3GW3ZXT2FNNbmkTnhaT+SYNJA5FRkhJfqRgiUdMWoFeaH/2QBeLrzUL7kNfnGcyLNA
	HWqjAwQcmzFBkzrUy8l9XzaivKMZwiWFvh+IpvAXO5lGQlPzHw5uKETzP9kqetclWzxIBFiOoNS
	qxFSyDfeWA66Vny5aPNcl20m/OwbyAAkgN4oXlVV1h+ybj58xcPqJL4upSwxAfDKNGSBxk0652t
	NG/nkR4AIm+AvVAFyF+le0NyUMqszFdRrkzDXUkIBuj8cgZ+5AZUTZibxlnmrP2zJrVJ0/lSiYI
	D2j9CjcN/py9ehH/jLd3eHO5gdOhlkfOWwOt1aimo5sonK20EC0iIvu514VS73EiK
X-Received: by 2002:a05:620a:7113:b0:949:569a:a3fa with SMTP id af79cd13be357-949ba9b82f4mr2029468985a.25.1795461277622;
        Mon, 23 Nov 2026 11:14:37 -0800 (PST)
X-Received: by 2002:a05:620a:7113:b0:949:569a:a3fa with SMTP id af79cd13be357-949ba9b82f4mr2029460285a.25.1795461276970;
        Mon, 23 Nov 2026 11:14:36 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm532978665e9.11.2026.11.23.11.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:14:36 -0800 (PST)
Date: Mon, 23 Nov 2026 21:14:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] clk: qcom: gcc-glymur: Add missing USB4 resets
Message-ID: <f2oeebfrfdqwhaqusxksunzc5poutvtwtycfokgsvotiyt55t5@kylt62n5yvv3>
References: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
 <20261123-topic-usb4_clks-v1-2-531ab5635c03@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-topic-usb4_clks-v1-2-531ab5635c03@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -mL2-eXAgcADaMeybxhMg5anYj5m4NNv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX4X9KIOkhS+8s
 2VfIIXkzG6qsY4t7tr91pp+o8dhvfaISM+Zkz1irbuZpUe4Zjm2h5UsOcvOpvaONBcOy3d4i+ue
 FNE2EbQ7uDTroDVBdTf4/PFIXsJsUYnRVjuslzSM2dT/bnWY2XHeOOzfqdBcErLoxPcYkwIXnXj
 D4NkIutvDnT+1SEBpV5l0Zhs0KTy7nIv6Mn0H8jf23O1WnbQuZzPKNQaHMUO6JdDVR5BKJpKp2H
 eEhy0D9UNrHOnV0iokUl46Ppxg7YxbLccXgbxHQUC/syqchyRDPuSsjOnWTP4HLcIgSsUDGrlA8
 F9Y05GzUDJ4Y4iV9QT1dd1YPYNfRSxWE/RHnP3WLjHMUW4+IALt5fBJ8XV6YC3UTpLSMzEVPwPO
 omZDakcH0B6YC51ygGYYFRfJLPyCaPQvsf6R9JTMP8lDQrFjjp/CC73RDAwJO0VUKuw5neYOpKr
 1Hi2IUV3hBO0ExaH/Zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfXzXIHqnzCtSdt
 GjbSW0STzqigG6/2sjMi5GGcn3Mop/pukeYyyxodPfqFDlYtvV7pDZZoZS68i+wEq18yJ4SRJqR
 ELo2Nr+GMqbm66+XBap0IElwxfYqeBo=
X-Proofpoint-GUID: -mL2-eXAgcADaMeybxhMg5anYj5m4NNv
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04909e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=w0_0LCA9YDJ5smxPYiAA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 26-11-23 19:34:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> A number of the USB4-related resets were left undescribed. Plumb them
> in.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
