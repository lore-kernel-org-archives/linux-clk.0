Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A42426D03
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768165; cv=none; b=Ilm+1ibwH/TWmLMGpXgkgHlSjsNEvXinyAdSMrNEAnN4uYqnzdWfxCXin+5ZE3/4aXwjw4CNVoGfRMvA1euJYtkGCvkhMZ5Rc6gcZu4lfPGgUjfsGtcGvTcT55BNrkjrpS0k8rnSMxbTKB6D8Eq3bm6qaY/hrSdbz9S4rwRPyoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768165; c=relaxed/simple;
	bh=Dzxyn31K18wMcByR8vcSiO2kisz9KWfmZLWAn2OFRO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ao8uRSBAMmBekKp4ycKAd4nJBiTYU3ntMT2lhROpq4B1DH+j0F6aMuKlSvy8ed92L7xom/Lm2RgFn+sjbf9bjyAsDhfosfl+4UwXxPJNQ0lyAnekSHzUqk0adw6zy3Pnf62CsemjYD199qmiEDU42SxDKjkZ3F2ddWma94CMh3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx8mTu15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NO0nx8zR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx8mTu15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NO0nx8zR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777XPF2668279
	for <linux-clk@vger.kernel.org>; Mon, 7 Sep 2026 08:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=; b=Xx8mTu15gUC2hCdS
	d8UrURUu3w9OYN90GrAGEB3UeSXz1oXSIoTqPURho5FVVCp7fhdH6kegs4uF07Au
	TaSxQW/YcLG4LBSTgwq40i5NIrI+krYDB1HVaeTdCbtAyl8q35L4OKa8ooqdM3Xj
	IFVaPOOCsL55IGjSlRvagHxiOCwgUfrXVNjDNB0dXORy33ALxUJcmG8st+luNBAa
	0ZkpG24B6cnHE2GoRRhtA7l3Ogub7z57KC76mC2lt2mXs4I7sjM7x2DsjLSnNihT
	xTXeh5UrjnMIduE7s1IU0ipXA72rr4kKj1IHHYMDC7HBeNOjc92yWoFEKAT0N74b
	/7xBwQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca5neq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 08:02:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52845bd815bso6058861cf.0
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768162; x=1789372962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=;
        b=NO0nx8zRK64am93qscSzzkrkDIA3fGzUfxAAHXbjEaWxlLZeKQ0DyNYIVr05zJXuQz
         n35mcLtn58gmMrqZufiD+KhikrlqWCbTLMv59QQ4BmSWn6lc/n8XoiYherMcdFIBYc54
         JNuUHtHkEfKxEwuZwq6BYOZDDMqjBByk4zjx7OEE09pe50lv0KHMMrsq6BsPSRztyrHL
         ma8uL7g2EkHIyaRPiDGWOUwLskkrjibTJJnid2s79b/LpRgYERsrMm8nN2yklMHc/rb+
         Yaf1sGwUPEJ+UgnGdNBfrxNsUqHS6s9LKAMl1qEdRtmFjyDIW8LgE6Qq5LkCyrzlkNYm
         E/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768162; x=1789372962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=;
        b=B8RFGFRcUY2sbcins8E8WeHmMZFSBhjzQm9TU58xw8E5pS8RJz55IAvOeAL0jPpDGj
         baO3oNmKUljD+DFjF4N42HLR+q0rWT2eM0N2Vd5Ki+yyqTtrEBfAWmifFdQTDKpRcAoS
         SPx1z7HdNh6pwRNWi4rngpx1Knf4CGeChTbPcPC62Aj3/uWfXNyvdFYrynkvkHkWP/nM
         YfuHJ7gk4nOjPjIPTDY/cibPgXWqSS/7KHXVMD+NR88Gm/F0q6vGauXbGV5lZfNC2P4d
         OfstlwIYLH/qI/ay9RICvdF1TNhwh2kFrEeFGh8/IdbZxHvnsjCAHfU6uLaixtFS4LhA
         aduw==
X-Forwarded-Encrypted: i=1; AKwUvBybKf0Mh2VReER3QWSSVILlrkYbNrUDgQndQN3cPWGHOlsqH7cXKW83CmTTYv6+4kvvOOs3ASGAlk0=@vger.kernel.org
X-Gm-Message-State: AFuF++lUG5Hvb3xlE5yV73kqUsOlu4aPrDtoimCPUYy2vEfLwe/nHzmM
	nm78G6Ung0Vfo1Spjg9jDPwXJ2cnooZyNo1RqTqkpSU1M2ALRUHBLVy6VCA2Hc/jGF1eJorcy/e
	fSiGUsSSTGNazIgOCZXYrVkcm6QkehSXIjgQaWS7S3rOpv8DCAWSNG3fFGD5xKiE=
X-Gm-Gg: AYBFou2QLuX3LvtgGwowLfl0s2/9WyK/AgqWvIR1l94nBckpHXiv2f1FNdCqmnqQ3i2
	soek0K4wCRWxg9tKANzSNxP1YAkGtcviGaPOIYECmh9UTFJrzs5oqV1rA/pm4lizyPBxRktrVVE
	AkW4zsGA5YR7qLWHeFgne0d4Vq2n47jwIawsETCMd0bKCafz6Ng/EEfgxKWG7Map8yuzCKOeVhA
	3+K2ze0TlEu3eajHygryEBWchHSu2VkTxv2DNxepdVgfxtwlIfuCMFV2VpP/QGQFH8FUMKJEBzc
	kUloUFu6IY55cGbfTZ0yVyK33sjOMtNVTfmas3Wm53BlAcYlnYY2yLr5j2Q0j4h+OwcrRq9IXGd
	qdJk6onxDYM2zKzUtmD/XnA==
X-Received: by 2002:a05:620a:3713:b0:939:b2f1:75d4 with SMTP id af79cd13be357-939b2f1778dmr84190685a.6.1788768162213;
        Mon, 07 Sep 2026 01:02:42 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:939:b2f1:75d4 with SMTP id af79cd13be357-939b2f1778dmr84185485a.6.1788768161652;
        Mon, 07 Sep 2026 01:02:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm433050766b.23.2026.09.07.01.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:02:40 -0700 (PDT)
Message-ID: <46c248d9-fc74-4f3c-85b7-8b678ae3c723@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS
 RCGs
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hKYyN9_zVGGsrQXe_JqdMtYEpYllb0XV
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9e6fa3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7NOcbVF-i3gUCoNk4r0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: hKYyN9_zVGGsrQXe_JqdMtYEpYllb0XV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX1HFOUjSBxnHR
 BUiqkcELcBzN1mm7LTMfUPc0FDinrob5uFtdU9ZsHwABK3sHuhGIk8NhSP7PhJhF2M/GVvpO8V8
 FZaSCuIiRsfRMHcigW2NYcfx2499+5Y0tMm+jiZSBfg9gSrbno/38144rRPuZ6N+GTdJOc3DK7S
 BO77oEwZm3cTZUA76iQNqDFJw3rdUVwuy+D6X2PXcWKzhOY9gfdL9ZJKSrw7rv7eSCQ1yFrV3b/
 PffBx71LL4aFOODSSjNCc/vGG7ttRF/GGTy5RRmKvXd7EFgY6JNu3qQLy2GLzNR5OcqTMu55H9t
 zeNsKGDm9gPPM6171pnumI4RvMfnnndEWZfmfxRTblQdmBmHC9f3KVfXXQ+gGNYIAjHK5S1x6l8
 b13MWVZ267teh/Z5Kosf5XyCJpA5laDu3lDxExePro/k55yiVj8uVL4IVKA76XhBpB0SfgpgA7W
 gjSYqWpO6+fpgHVIrLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX7ZcrexROWBwA
 fiwZjl0GEwnukxVvkW/eBmSG9mAZCdpWosuULxRqHiiovIbp8U8Xd4desKTeF5HtCg/NZjebE5K
 TeLlTZ2XNUGoR3W8FvOQviz1GfHdb3o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070086

On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
> Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
> during clk registration.
> 
> This ensures the RCGs are connected to a valid running source clk before
> the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
> sequence.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Is the no_init_park variant an actual problem here? When reading back
_CFG, is the parent preset to the UFS clock (which isn't running)?

Konrad
