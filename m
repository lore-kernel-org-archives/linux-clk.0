Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407344;
	b=SH4JWR4u+O6q105B8XNEeLA/4XudNgjjIGe67AVDcCpKB4RuqMU1IDemkLQxsSpTDs/b
	 tBF67r16NrMkd9OMNhfC3pobh+Tw9kyME2P9OGv0yab07zZsuHnONGk90XVepzB4sPQ0W
	 22JwT46nGJtdETgbQHy4mXfwY99rvUu/OzBAL8HFyrOkd1LkP5KeC4qFYx6nAifztzlv+
	 P6OqBAe214DpgQAtt21BVZYLLlO7SZ2GGMhkMmDIuyIbhhctPVp5aEjA0AFVRlaDbrrPs
	 edZopL7vBXBy2wMt2AJhaWEaIvEUVGzMQtbYUJdEvVGvy5HBtgxJsYZNhOwCBOGSFxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
	b=mlxIARzECkSonz+KJpzklvgQ+9VTSDOM1nzVw5DNy33HQIetbWEtY6kWqKXq30/k8TiM
	 51JE7UfX3IMs/xLqEea97s0poePDLD+lvptEG/IU3dCieMKl1tWojfVthtTzE2D0BlFHd
	 WWKW+tonum7CSLpI1MvuUaBBbc+t+PW0M5+s0p4gPr/3HF0Wj4Mdk3sUgJ0BdSt0And4k
	 OTM3A0JTW3BJTNi5n0HsaIsuISSWpIM4DUUpmtXI4/mdOk9V6HHuMaf8XJb6JyyyQ3cem
	 MnxPMPEXMWCeIaIvQOp90yJILccmwEF0wYjsosqrlPTsXyYgoL1FCGX78l38szc6cIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhrY4cSQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYfYXp9O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE755606A327
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 14:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE755606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhrY4cSQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYfYXp9O
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEJbHW528261
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 14:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FvLCFQbdJHdvS8TiMxoEDBC0
	gskgFKfqHEXYuNhy+a0=; b=JhrY4cSQYGOtqDcNJaKvvgLzaupKE1Ku3eDcqwyX
	QDHO1k0bvbgSW/KCwm/VFAc0rVHSknHxz36AL9C0b/BVHI7rPYMG1xi/XXGyGGXT
	PrfN2GlbXn6avqLd70EZi+lIlPlJH/3Fe1iplD+ubpTojdFgCluVGK20X6FIehYg
	GM76rfGBAk1oVVMVzlxUjBiOlRJyvhRd2GvUhw+MaJewvJQpIZK2IUF0G8+CediS
	h3rmQyhiPo63i0sCVwJlnKKIYY8TUo0Jque6Ys584O3MMvhhVpOrGoMtCSeBgpyB
	3cawDBTf/NEhweoavDi5an2wzlyvoOPwLoeASltoopFzFw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjrxht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 14:29:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98a829c43f3so678465241.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 06:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407342; x=1795012142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
        b=gYfYXp9OD7PM7oOU70POvyJhUdKhV7sHsZhU5aF2+qVWuiXwcMer4xyFEJTa/saBfL
         xd9QMrKc4X2rF6NFNxR9e50+Jh+dMXKMJQdCjRpRvbwtBvDhYHM3RCfaGZqYC3UXjCOR
         KFKZQaYtREBPRj2PRfqu1UcLa59rNA2izJ6poxC7c1WYiAtD+KRbDNtkEV1htHtcetRu
         LMdCe5C1e8uez0s8FlfrZW/CaSPA4C+I2/owbLLmqbQ9eXA3RDajw1ygWVBkZDDWDg7W
         HnOksA9Vyr0ix5MWUmPyokSBxc8bat7IQ3xwvciYNJqtBhfAGFVONNBQ+Ly1Lq3Vt6eK
         Q8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407342; x=1795012142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
        b=I+FvZOFKzhxbDpU3xIRy7qW4AqtgveBHIB9HAi+P2+JRa5elPIbbF83UHy22we4o6e
         3fdQhDIBvquh9u0ZZvUkPatMQkC+bwsb5wbt7hcDKw4HgAnLN1pc2z9q0NpDORerAOLf
         7a8pP9LHWlf6l8HywtZx/Mtp5r4dthMXRfTLgikby5PppEkEhtwLrYeHJNmU8WxLWEaK
         WZs2kJiCIhRH0z8VFPiYDvyffseE5Nw8z5fCL3K5pfNooHvkOb8uDgnNuzXSD9vVzeY7
         uTQjvsIrP7XnJbloyxPmE8js9g7cmqxqgvh2yuQlLwac7EKzT0+UJnjNIwhu9kWS5ayI
         PPag==
X-Forwarded-Encrypted: i=1; AL+hErHEA3LkSo27/1x3/JSEk1SM2szcO9AAapCKS7e77l9+uTob11kaGee95ai6f6xfjVL6fwSIAB/UWNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/YTTv3rkRUaNW9AVlCGjpLej7MAJO9xf2PQlfNLZRBPLCU3I4
	c+b+M4JyQzPyE8b6uRJjtbwbqUL56QqcH6zSLCAY9m7Crbnj5pfO1Wkg9zTPX3YYyRedwZIsqoi
	yRtSs/AlLysGbjSM8dt27TK1nM9LS1vreWGxDGG9d38biuLzEWQR4bqZTcbt2fDg=
X-Gm-Gg: AYBFou3+tUi3qhhhjvSpi2hxHpJ7lvhtQAlKFqfcFtHPLibMInJbfi5mtGhnCQt0Po9
	1HOTIpeat4MlhMr3ibtQN5xqcqLBGJKP/EdQpmUPQwnC5pN5qVP78zovB+saZwXiEJqvr0zavBy
	ItMqf8npyPehGeigKRMRh5x/zLO72XqpdSd0l5Ge8ROmoo6X6iExT4277njYFd4TF6jcyBogR8F
	vat9kRAeyR323jPtoMJOGcaQRg6JQsnTwmf8DyTqQpPs5FwwT61Z6a25NFDhEUmtCx+AUiFQsVI
	uAEwxx14mftxkzypBEefLjxTNVmNQKcfKuRcr8DGKKxYVMh3+rv9++H6KIQTLPko2CGNpjPzyFY
	86JTF44ojO8rCU63DS5TV7cuNrtfQTOBJnV1ignQFiTBocdnynys6L/hlviT69g7X
X-Received: by 2002:a05:6102:54ab:b0:7d2:d159:f425 with SMTP id ada2fe7eead31-7d5060c736dmr784581137.19.1794407341925;
        Wed, 11 Nov 2026 06:29:01 -0800 (PST)
X-Received: by 2002:a05:6102:54ab:b0:7d2:d159:f425 with SMTP id ada2fe7eead31-7d5060c736dmr784569137.19.1794407341298;
        Wed, 11 Nov 2026 06:29:01 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm12553846f8f.42.2026.11.11.06.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:29:00 -0800 (PST)
Date: Wed, 11 Nov 2026 16:28:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock support
Message-ID: <25wbcmrhttoceflek62nu3e53xzb2jnaamawpyd4skiwnmmpjb@252s6ee2f5ol>
References: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
 <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
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
In-Reply-To: <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX4z497idEFC4g
 62lrmTeb2X/aKpS5GBTiwHBv7s7SaOtBAm9zqXlTDpz3Tu0/QPpyFZaA78UHaVKMQsv3I5hvYN2
 uQcpZW2liR6pYhoGCj8A/VY5efIjfT4Q729zhQHrl2hNnjsVmXPnyQFGGKXWZC8lth0qvZXLW7F
 vPQUSAAFYVSt14S++N9j9vXQIqusmCPm+QCInhLGme+o0b2WJSW7+C0+nziAECcAlxK5Zi/5EpX
 YtJgzswYBwaJgci2cO+iibwJIr+OZeww4XWqgxHl06bGrVb56+Twt9dJqvc2BOe/eVp6/W3Y3K7
 vZU2zXbk+DtFfYxAST6rSa4LOEejV04pjk80O0BJeE18MFqbYkqYa1xvo3EClqJgdPAeByMgi8b
 nTfA/PPHnFNkoRgULWqFLun0nhW4oK4fNOcuTTLc1/3OSngvBMzk3D9GX7q5hD72P3bkCggyf7O
 tXNIe6rFI2vo+A5OkMA==
X-Proofpoint-ORIG-GUID: ncMwrxw7XIAeyx5w38BMbNOhVEWd9tDc
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af47bae cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OnpAFzfR-JcWsVFUPsAA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: ncMwrxw7XIAeyx5w38BMbNOhVEWd9tDc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX9NvJ+rWO5jvQ
 hyALwjpRKNuCbMFaQ57SdMd5RyY9gjfo+GCLkCLhdbmQqEh8Mmaj+68qnlwGYkmvrtdu9kCFakp
 yQ5EyMQqNu29UqpTrkesEi88uSz2fs4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On 26-11-07 23:36:37, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
