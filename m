Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168579;
	b=zRfWoET7TulXtX/u5ZJs0AORprOnpuHrEF1iVrLXew+uUtrNrUXNVajVzP9lS/7nUWLT
	 D0lg3aEt+pcq9JaEKb4wJI2EX7N4K4rsyjO4O6UXl+wBfzw6YAXbr7uUiPXKj8GI+Cw2x
	 BEzptVWFxF/K9RfahZangK7f74Pp8wgFxWOEhAW1OHH0YKb605rqo8iZ7rrsBN0fwuRLx
	 2+wgQpLXhEbyI367VihMFirRfE/1cS3yPpLqsu4afrjwYqIPq0gEFQIU536MKeo0ji+bG
	 G1vlHoE12eLSRgtdiCTUbQlasxj8+XUOJaRBzBd8djAZRUrtqn92VAxb6WsHJmdTyeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168579;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=62eMXVAhsdOLajmrx/nEro/aU3Oy4TAFM0MOIhVJt+Q=;
	b=YxQaBF/+QXNq8YgrRrKZwTmyYNiU0R6NgX0k19Nopf+EQ4JhWqEc1l0EP0GrieX0Laqi
	 ZlIdo7hnsZRtZhu7wxWxj/8nLo6mYYXqndQF1ewLS67uWJUzRafWGMa7lQqAZH13iDjkM
	 NEM1GAEz054pg6Pv2OUJZYecwCTCOpL2lONKE+aARRv+Fmlz9SwsJQlN5FqJhHwn4I8d2
	 vCni0yiXyz9o2v6PVm/ND/pXtWxsGqAaJ4EKPEqLFBmYVEmBVJnIx47G1vEUN0ayflpBL
	 qgTbUwRlHKcRcrix2ge7c6G5CPzjiAfVKSpoSMNjmCmRYRWdixezZyq1QEQzPL1rM1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DtBZuUDj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JTLBdE3L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C286A606A320
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 09:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C286A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DtBZuUDj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JTLBdE3L
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK8te4f815627
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 09:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=62eMXVAhsdOLajmrx/nEro/a
	U3Oy4TAFM0MOIhVJt+Q=; b=DtBZuUDjme/84lhCpowIjh4IA7DZGsYJ9xpjZP+i
	kV1Z4tp3kMmww3fOatjtqQZ38Pf/Wf7lRdvRn0KEffg8CiBaC1MIkFEjSvJft4bU
	d9J9rt6BmsRA/VPAjktQn2F7U9KwRXWz/xPgFEvwitq0Ivsqw3q64DfFNV+nnT/7
	gr7IkNBRMlm6s/mC1FczAeaLcyQV+XfhFFnKYGFqoDigURsH6GZ4/i/EfMfAZCUJ
	VxFUzpoEdz2OuyMCaofk1qJtkEElziuYtXxzSIS+HCrZT+9mA+G83IHFHMUWIzlB
	77UTAKN7z6v1TBUfM7eHSFOFeyjWERqLRkeSr07DVSPBVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyk2tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 09:56:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so132271885a.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 01:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168577; x=1795773377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62eMXVAhsdOLajmrx/nEro/aU3Oy4TAFM0MOIhVJt+Q=;
        b=JTLBdE3LjVJxvkDC6Ly8UL7Fb7xbgpvu/LTV94IfDcHvJauprqlS8/iFkKoOvT9o9W
         d41A5RP0GZ00g1Mj2sUFcih48dQItsqUj3txC/IZaA4heSmP50lyiPnvYZI5Pu1ab8cw
         KCaV9FeS87aVnfb6D4vKT5T/a/++unJCg4iCACHhGfvUMTi0vl2NrgbMsT3YsBJCQSp4
         pZ6VjHaxFjrywa88Mt3O35t0gbXuvQzJIq6twUz2CI39TWxgZe25cq0rlZt4ksMtILyx
         eN2Bty8uFX+En23W1FdbNBveRLBV8QlRzcUsG+aJzuFRO+hTft9X+YVpPio5TUrjfld/
         wmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168577; x=1795773377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62eMXVAhsdOLajmrx/nEro/aU3Oy4TAFM0MOIhVJt+Q=;
        b=dCDklxz6xwkaYLkZz3/yI5XYqxZxHyYebR0IWUm1gZ1aYB3JRHkxb6bdOkayQh3S5u
         odI4+a9W0VZeIl79jHdN5JH2O+EtKechMPjPuHYZ5Eqsq1wOZaRevIL22s1x0JunkCGZ
         f7/9VkFnnh767yT1jnI4OGQK1YOv1atZIy+Q2LkgF+eVv+xFB7UWiMj+8BuuhrYjgSha
         q7Y26hNQJ6VDCBnbYlhBXU85xwH8VDiHSPqoB796guoNBcAt+ZvtoujuYbUxczFt739l
         Hk8p7y9oUgB5HWK5ZfQUocFj3hH6+5a8tI7dl3X9o/jSdCc3CAPjAI+2lyb22sVVcexC
         M8JQ==
X-Forwarded-Encrypted: i=1; AL+hErEySMZ8OT8mOP1+XdWzYVRG5mXo6MekyP+jCGaN2dEdxk+R6gNlOgzO0M/0Um5Q2Q89ASO7Ad/MaIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ht8JX+L0fFT+1c3HlCd3s4DzQox6XfjodWwacBHc3DmRoRHAM
	w5KMS8j8ofSXRcETeefA3M//0My0M7gUHLUzE72gexj2s7WiRmxuPM1uF7JWXFOVtk/Eb48uhZr
	uusr0W5Uo5j3u5B7nbkcG6O3CAHlJJkYWkH6kSYkZ1beKIYr/bPgUdBYWRGqhoGQ=
X-Gm-Gg: AYBFou0s12bGNcgndNGPypNQoFohizQsTKCFFPhU7Ew0Rd82UCpdXCbTxdfSncaCVsv
	wMyVjeak+spe5yX/OHk9OkQazgbhlLNnuOrPDxzD1eF/dzCjpSs+I3o/WHzVNFPb3fChb/HmLZL
	yI4zozg5pYHa5QcEJv724H3Lj7zeSQqoeAZ/vo5j03GvIeaNTY/svRDFa4bv8U4lQPizOjU2h2g
	kTRQtf0/tAAAYM+S/NXjCURsB4cWwWJIXOy4rZztff//A/a7HgDpxtRF7UnZmHL/TDC3oCcjcn1
	+6ul8G4VUaVMLlRDo8ANkeFx1izg/RuYAh2dGvJ3DICoclNu9nzxCx4ApVrTVDn18lkTWbQM1Tw
	K3/CloDqvZNklf+A7pQtyLRaAp2Ir3lcNFaRGOGNgiMcoR2mztThULOrBPIUNPGp5
X-Received: by 2002:a05:620a:4693:b0:93f:2b23:481b with SMTP id af79cd13be357-949ba955b51mr440889185a.22.1795168576901;
        Fri, 20 Nov 2026 01:56:16 -0800 (PST)
X-Received: by 2002:a05:620a:4693:b0:93f:2b23:481b with SMTP id af79cd13be357-949ba955b51mr440885085a.22.1795168576349;
        Fri, 20 Nov 2026 01:56:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm4320876f8f.26.2026.11.20.01.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:56:15 -0800 (PST)
Date: Fri, 20 Nov 2026 11:56:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: camcc-eliza: Declare icc path dependency
 for TITAN_TOP_GDSC
Message-ID: <vgclluwnmognwpaxmwazb3i6teyrktvbig3ykf74ppjbp24kze@umzxgoirryxf>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
 <20261118-camcc-fix-v1-2-279d269e343b@oss.qualcomm.com>
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
In-Reply-To: <20261118-camcc-fix-v1-2-279d269e343b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfXzP/uvexFei/0
 jLaFkzybAqUdoV1eR7RVoi4G8jJqNUZgoAkHWSBb9f/3aevPyK1uQrIRxdHFrsRjPtoaCCICd46
 PeOZaXB6N6PEJdpJnJPykqgNyDf7VKc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfXxJqvXfPvJJYp
 Q6VPcOp+v4DxXWX95RXCkDJY3Za0Nv+cO2WihEBTO+yYmafUyH1ajg7WLgF1NlFQC7uEMTDvE2J
 JnsaPx10LPJKgJtVEAGSAFz0EMs1B5e5VtNvE+CVDxflnn0OjFqTQ+3sVbKm5SkFf43XzTb1b1O
 N51RDdJHfUQZkS+4KOrKVB6cr2sLzk2C21SGX5Q5GWSPEb2k5RESJvEG8BaA/zmKOB12Icd1u2g
 swxSpvHUjvLz0QP0UiZk+r7r31oNVco8NmUJrgVCZSP863G+WuiOoVW6793IR1j1FBUfZG3EBrH
 uTw37/OXfHEZgdmCBiwgSwPx6+4xvBy6RGZeeN8a+v7VoFG1JBKVVPzUmoaP1beFjmk33ab0hXe
 0IY11r5TIkEZCC7JnK006iTGosfm3fikyYyEaUXw6R2erBrqg8OeXuGI0IUMxTiv2/87nO/NK8o
 nuU7ukGZXfJatenmmZg==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b001941 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cBiroVCkOlD2lhM5SNwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: evY5hIgSVkVvTKkbk5vxLmrnY2Rd8EY1
X-Proofpoint-GUID: evY5hIgSVkVvTKkbk5vxLmrnY2Rd8EY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200039

On 26-11-18 15:45:06, Wenmeng Liu wrote:
> The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
> without any client vote while TITAN_TOP is still on, MMNOC attempts a
> power collapse while camnoc may still be active (QACTIVE high). The
> power collapse then gets stuck, and so does the MMNOC BCM, so any later
> bandwidth request through it times out in RPMh:
> 
>   Error sending AMC RPMH requests (-110)
> 
> Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
> voted for as long as the GDSC is on.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
