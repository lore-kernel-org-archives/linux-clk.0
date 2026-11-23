Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461410;
	b=rA7zlMLfHdZWxfTslZD9DwD541yiQmaoOU9njtppYWIH9WCsBY5cJxvbQrL+UMbkbtGg
	 Wy4Xr/0+bWuh13mzjXr56/hq1Akwe2XOnsWvjl9zPkui+HPtkHgbJVKdA8l51wjfyo8ep
	 Hqc1mz1MVRoQJRW1fpHcE8ZTF63LIjcSc7aczF+DAV0FTiGI9MB/4cwWpdFe0S1V95zzW
	 S963lgJbjivnxxXas2WBp9S7vQaGw3hNWCY+pjsI4OGqWrw6c4oN2Y3DzQ8eNBLB4b7oy
	 2jhdYdRLBt1/H7UQpi/7QHYopScDhB4JJfIUsS6bJOJrmU2qcSrIqDifF7aK3ty31vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iTD3QrTZlVtkdPEUbDHvJVFhrOqBKwh9s3utgL/EWHU=;
	b=kzk5SyrX0X3oO53zAmwWXXxsmKWhXEeKdoUuIDTFoDFF2OeOi0RtmxCtstyITi8RERq8
	 DHMVRjGNtmnMQVfJtRX3Arkr6QuH3xLOzxDuU7m7itWS/NZEC3oeXlRTdZdEQFxlC3MGN
	 fCXBdgSoaNEnpjgTO853fnF5QVuqnjUvdNZ8dRx/nB+ShMHgMUzUOXO2yHYMuasEJLqYa
	 Wdusmv34O5McilBxw/qjVUvvRfqRAnC5PSJ+GcuroXabw8ggRXq4GytrrLpQgJQ2e/iPl
	 2uXcgpcgbKQYVlg86aJdLy9uQ2kW7HFyFgCA9uh4PvMdisT6zxBpWgUa/s0iRNiXR6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2DACRBO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2GXq6sk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE96606A31A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE96606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2DACRBO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2GXq6sk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGkCV3025235
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iTD3QrTZlVtkdPEUbDHvJVFh
	rOqBKwh9s3utgL/EWHU=; b=l2DACRBOH2VnI6FVCXclKpIqWlXSmnHu7cRyqYWY
	ro7RZaAkSfErzWgp7dNYovNDQgNTrFTsAsvpcBXjq/V5ltRB91TDnVWjL5NQcexi
	Xz49ZoYFkQ3v0ml7zaDzOLI2rpWL9vj5OlDCJeXkEVObWyCqmNqVT+uFRnmm+qTR
	r2wheBuqK0YGs4cJRFeEmfZkDpBoBUaZ7OmgSCPh/OgMKinMsPFXOH/102Z2Wg5w
	9Z10UuBn8Ii+lGyR9ZjKtumBgBYygwfhDp22kt+awZKC8iOVbbeihkKJAtnYU4cg
	wSdSc2xGmpvMJJH96vTBXnwtQvsKvr/hPSh+6+4x1lEhaQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb2rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:16:48 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b18c67095dso51611297b3.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461408; x=1796066208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iTD3QrTZlVtkdPEUbDHvJVFhrOqBKwh9s3utgL/EWHU=;
        b=F2GXq6skIZACS/YNLBT1jjTq9FI9u/Th65Spg7NHmpuznzM1VJ5hFfRB/vNBOaNRcS
         MU8wzKV+YRZQ9O1pf6/57SGyK3VylTnTBVsZDBV8ggrsgpq1BrTxdNPV7al1OytrtMM6
         e6effqIXWwksWDbe+yjdwJdcbWyUuuHUG3sCixV11AizrBzxyitb4D4QMHfc/Jbq2GkE
         mbb0ntGLaCIounbp8Y85whQLt8ENiczB6ocjrLvrBYc7nXJyM6O304JtiOW5RLlFIc7q
         f/hf/ZN/wEnA5gE4US6LgyIcZg3DcJLRs9Zmko8ta5IfRL70CNQI5wFLe6qmbntFdcRB
         RVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461408; x=1796066208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTD3QrTZlVtkdPEUbDHvJVFhrOqBKwh9s3utgL/EWHU=;
        b=cukKiUEBSDX6KhoMIYOaPaKkPe1WkZb+FpFUcld279i3LLxfNWJy9XHLFQVvyAviQo
         L0qypq4jq2GZXK2hCx8QrdxYqTzooURR1tdm2WovjVq5gY9fOzjc/9aOim7bTowTVBwj
         UmPkG4p2IwwtYZ4sujP1DZWOoNzwgIc9tBPE5YVInNvvM1di/SO1VSd3WTuVkYbRVsoF
         hklv4DhBKGMMNAAVpdK5uImQKthipO3kcKnhP6syWakbmZ/RAg6wFoimee976GIj6fk1
         1drDDQFrCU6A/KAOkEVZzSSmmps0bsONf2VeiojPm8ch9dYVIjCeK62u8CEn+XZjiksV
         d9BA==
X-Forwarded-Encrypted: i=1; AL+hErGA2qiVgJuezhvvK5o0Ouh9t5EH+XPof+Hi+FndAn8/EFHxL0IqJCpqBB2lDMwSsoxuf3aTq1AEE7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SflDh303+yH6db75RaHAKlOEmRFxXOnwOqTEP19y7q2x/RyrY
	h4k4We79FwElYGihW2/igFb1q5iIPwU1mmgN/wAKvxgoaBUxMwS7/sjCTv4TiSrZNKgyoy0hyAE
	g3d4Zd4ydR8AXBjrwFTOPVqw62ZaFBRYgp9vcMSZBmgWvDdpI6LCBwJFrSIcjSxM=
X-Gm-Gg: AZFdTZek0IJyjIiLxLO006yS84eJVK7B1AZxxBk/mA7JUMqL+zZ5etXXmpfAy8j56+v
	97s9aPtwW7NC+5qoCY99lVBGCo3PFy16XmnzRvUqcf+50cQ5qPCFBuRVLhrT6pfIyybQv2JtgBv
	Rc0sEFB6OeD3GMqgpJgCneSuyLbsjFpOE/62+OKAm47asUikOEJxRMeT/xwQoGkCrTilVm4hk14
	3qs8d4UyH8OLOs1YLGDmd69De7YbEFbD3WQaK0WTr9eO5ApJoOdadySit2xlhQLg+Q/VdgW5ScG
	qWS7bOUI3wQtlUs8eiGp9IrkT681PsJfniWG48OHrOV6qObEsNKiNUiY61A6WilgwqlA/kj1aYU
	EvNE3tsq2vUnpRt85j3dseYIXeE4ffgm1h4zgtrXtWQQLZIiY4c9xmh2dLyaSCR5r
X-Received: by 2002:a05:690c:e1c8:10b0:8b5:2fa8:a678 with SMTP id 00721157ae682-8b52fa8a72amr25662607b3.14.1795461407745;
        Mon, 23 Nov 2026 11:16:47 -0800 (PST)
X-Received: by 2002:a05:690c:e1c8:10b0:8b5:2fa8:a678 with SMTP id 00721157ae682-8b52fa8a72amr25662367b3.14.1795461407044;
        Mon, 23 Nov 2026 11:16:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm23434678f8f.10.2026.11.23.11.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:16:46 -0800 (PST)
Date: Mon, 23 Nov 2026 21:16:45 +0200
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
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: Convert USB4 clocks to use
 phymux ops
Message-ID: <6hypfzcubivolbtygk7a6pma226yzdqwurxairyeomnpexlo2i@rnlvijyghav6>
References: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
 <20261123-topic-usb4_clks-v1-4-531ab5635c03@oss.qualcomm.com>
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
In-Reply-To: <20261123-topic-usb4_clks-v1-4-531ab5635c03@oss.qualcomm.com>
X-Proofpoint-GUID: 6Oxtuvl00EQTVAW1b-W9bqjlaHRe0vCS
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b049120 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_3OWXpHg_koiZCJ6kicA:9 a=CjuIK1q_8ugA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX2n3QlvBWiGxc
 f2Im9qQX8/51zWkPpVH1EHSu+TUOsj/2X7mVeAjOJGWYh0KzHq1nXz40ZpU7i8aFCUg6c6+7aeJ
 5FPID2APFAkHqgBp9mhW/IYd9M6tQEI=
X-Proofpoint-ORIG-GUID: 6Oxtuvl00EQTVAW1b-W9bqjlaHRe0vCS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX5IpQb+9kgHjk
 vHlHTuiscps4OnwC/0eHJuS+9DVhUrxe3GNFHCbifVxNznr6kNne2ovWcGDnnxvi4iqLpMJnW/M
 yylwox8tYWhZBdQae9U9xBMZxIYSlQXACPf+89MawX05qRqkSz+tNCcMArtCPjjgG/s6rc9Iflt
 Kg1XCDz919A+hxZkrNcSfFShHyPf0BOs+RXU4VKgkIUhLYeJQonFb3SUQr2vgdTLuqOHQTuVdsK
 l0RMMRx92BERwq4KDXccKCXzRr4m5C2NdzF59owazx/NmfgftCZs3RHzJximfbk6WMuLPmmgrup
 BVPRQmkGC8UZjgZIcw/Xf5VP2Lmq728yR25eN89hwOGhMtPgdQL/AkdZkurlzEzMEKovB0yG+5x
 Z3uY+KN0NZ8xwE/xvKOi+Rrp9M4YqnfsDrwAs652e7x4lfM/+plGJc95vAkcrnLXEJp5eLta9bs
 Po6fv0lcrnLa9b2usHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230076

On 26-11-23 19:34:34, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Almost all of the USB4 clocks fall into the "phymux" category, with a
> glitch-free mux switching between an XO source and the "fast clock"
> derived from one of the connected PHY's outputs. That allows for
> running the downstream devices (at reduced capacity) even without the
> PHY being oneline.
> 
> Convert such USB4 clocks over.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
