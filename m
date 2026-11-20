Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170078;
	b=a2VEI/ZTViX5isTqpFnP3xq0rP9HzhtrbE3DgB9KJgnpPMbrmaFux8A5/EE6v3uwqVhk
	 U8WV7S8Ce5r4CFJOCCqtXR+W7KZLQZpMnjhHwtJsekF1g8Y4171wFnZPVUIC1S430H175
	 Vf38fhMpwVsQ3Q5YEpyxJtlordxC0Hy1EGxkXS+qkrfUJ+6sxDk74lr6mWZsOxvk3LfqV
	 lDPRGNUj11CoGpdn8bJ7G4oNXCaTIVKWxORoBI8o+F/HY9Q/01C5ygSiB0aj0mHiVGxNR
	 VmOQcTyMoGlQZihuIKDxjVUnN3qeNAKtAu+ZTxlubq0168q1PP3vONDdEDF8rQw9dbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
	b=ki3xFi+fIxiG5j/BzNBExGPBQIAXOBVmExGZU8vA4TGbNq1fPeWExNLHHh3Q0haqgTLv
	 7eqsEWbWgyQMPi/YBPNYQbHQ9pQcOt69q9yQ3KRtbgLi6Cqr7xXMCj2xgHZibGXlXmmgW
	 PdabKHcbZZW31HB8NlFZmvQMrjTv7SUtjtYdDKPdI2hGY7/GrK+54PNw59HNTRKe6rCnU
	 aC6gvxkiUAp4UsbJMGQ5M2Pyyp6a/xzQPZO2XqMWWJmxttVuPs4UlRNlyLSui5PIRxK4H
	 FK0mu9MEZ/68FcjlvG+ETkLulbNNfTvJ8te6DxZs+Rsc5ZKgv5GwFDO4Bl/DZQyB6qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiQQmnZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFgi5Vhs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB4B606A332
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB4B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiQQmnZP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFgi5Vhs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqtD144481
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n6xNjiXLI4ldZMgm9vuyivlF
	eIPVFifPb1EDl7UJecI=; b=CiQQmnZPTzu9L41uX++xGZzjLXHOfK8Pbf6a9gvv
	1b3ZmL84IQyGNMUUyQXpRlOPbv7v23GfD3cD4qderzPHqcNp0Sc/RelCW7K0YnFX
	/qBmQ19QNwi50g8JyAhmj4ClBHBEIfm2trb5SjhaSsUNBbjYrMHa1AY8TIuAAnM5
	dGgwM3Iqw4Wul05TOvDuZvhfKvgPydFUmoi4yje0wedMFLLGtlkH/UpG3rOu/kNA
	qSS57tfItpUDX1QVfovE3k692uv15pkjeWBQ5R8C0Eb8t3Jpk2ENdS37v8opHbTP
	5BuRybzmncizaSw8fbTOiIO6biDIp4A8WMvpC9+Bs3Wupg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbh8qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:21:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso141877885a.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170075; x=1795774875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
        b=NFgi5Vhsn4vUb/dJrGBKsAI3iD6JYIgFx6PlTkCMFzalQnnNOBBws3Tt49vqVsO5uJ
         nuIGID8R+E8jWn5uqdILU4PsoLD4aGeJwqza5txtBrIFLzJRR9M74vfx5TvqodL3Jecj
         iB9SSLFMi36yt9yfyIgUVD5jddTPnfXcUNAEnsAcj3m//rh0ghlGbGRFLgZyRwX3f3al
         SwRgGD69gl0PSsvDmH2Z+BzB991hQBtpYLPhkJg+grUSSdc2QpxOQgto1/exSveWfuKR
         uSyIHHCEUJpVrl4MnDCywRouZUdekQkzz8L36KrEa6eFiK1hTZQmQpu0Uak0YwG+BPnw
         p1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170075; x=1795774875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
        b=YOG2FnkAzBIWs5gR/eQEb6k9ulC/zOekultXYSJVwG/lpQUpHOac9Lgubmzace5h2O
         dI8v/bqt3h/5x+pSlNWLgDVYJoaWGFK8rZDxQjTMOgAoCxVgngIynGcQR1oALKkAVq4a
         cqhDLm2Wtr5kGJ47DCRAfKnA8fLP3ZnsgJAIHZEKlk8xrVrpPn2KzY1VsiHG1I9Rp63t
         RoPplE+YofWhzr38eOSEFjg4PvrF+H66JK/iqCbnhTQpOx2O9RJdMlB8sjon9coPv1Op
         zzJk6zdW4fL2XSwPg+Hmco9O4RkGFVI4uTikPq3dSTM3NRyNc+JHM90LmT9PwB4sj7yz
         KFSQ==
X-Forwarded-Encrypted: i=1; AL+hErEDLT0mD5K2M03D722d0DJqubAA0slBkueAq3lsBPzRcxA8ELkQhsPz3KeT6GKNhRRR3ZJnHe+k8Vg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+05uZfjxw1xropDkGU8BfW5Kgy6Y5GtKNlSPHGOsQVJbioRuTt
	VMFh1zkaBpesPLQaztK3qXqqGWcsyaaH4TqS6LZ29oq+fDC9qnoHcoEgbrhQ/cVu9v99Vek57La
	FmBnpAcIsxdWyKENJBV6beeZzTFmmW4IF28rE+wJydhRZd2LbJiwKnbsqEMbjRA0=
X-Gm-Gg: AYBFou37Q9CEgD0+8owgoGupzkbHaG6MCOXnZhZ1fL0gDdvNzwbb+FAGbBoexMVvtjb
	W+df4BsWUvCDkGrvxjNz7VKOjaNVb2Z5dHhbkwzoeiEnfE3+MsHU4vY4vRaHc3z4yE3UMgUYBBl
	4H1vdXIcQcmK4kyAwl4vh1aXaJLnx8lKch3/IpVUjQhyN0VipYAu68ikp99ws/t65nCA6Q+/vzj
	ZpAfrI1Hruv4A7sU33cmKMB8mIk0AUXrth47cOa99aYcD6JlWrx/J+sP+ZEqzWBpibAQD2YuksA
	jTVwPciFyL71f3f2An0BbJ2zlMtg2oUkTVrX5lbaMa7YhnoKmCdsnKMNQswTr7Cx/xqGwY8gIBt
	fBtWPoaBlrDmzt8HSzkhsiTw5fg8bzVGW+p2KReecqVtld2gV2cZMyKeP1zddOAFh
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr406230285a.63.1795170074881;
        Fri, 20 Nov 2026 02:21:14 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr406225985a.63.1795170074176;
        Fri, 20 Nov 2026 02:21:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm29150615e9.1.2026.11.20.02.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:21:13 -0800 (PST)
Date: Fri, 20 Nov 2026 12:21:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq5210: Add NSS clock
 controller node
Message-ID: <m77xx44vjdg7e5myewy63j6nhdkgqnvvdyhqnohmylnbputjwm@2ymesyhjurov>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
 <20261116-qcom_ipq5210_nsscc-v3-4-1eaf92698379@oss.qualcomm.com>
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
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-4-1eaf92698379@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX3dYzybuMkTXf
 1hMNXnaJ/HHu/zc39YQjaqcaE3NIrtPLcEF/nTSJeBfzHlXnxp4OhMEwqPDM00WChIy0Buq7vb3
 h3po3DLoM+ok+ANfmrRsECP2Anyv7N/gTXajAY8PIHmFkFNJv8Fyr/tih7jaZVNQ3uNor+e/ppG
 DjqtUpwfDKdaTjEUDpzUbv5QwzjfVIADeLCDYaYb7Ute+Bf7zu6U5J0XCKfsuSadvZ25jmcxf54
 W1HV4PHRVE3Jabyx4uWMOWfwyaxukUEmaTuKKzZtUj9H9akW/InrmKUCURSffTa23acze1PVIde
 Hs8Gr4fU7oKed6ihGX7pLnbcZ2N36AkAzZvlPvJifp+g5Q3isxmKnHRsClM50pwOHExYU0KFtyA
 ZnKOIHYJb+xLZgsx+YlrDX7YtLHhZFfZ3l/ZsPH72jFDv8EV8SBhiHELpDOtRgZHe3Fs6kEYOCw
 5yDF52OIhyHvouK8lsA==
X-Proofpoint-GUID: EpkpCC9hkgW3BwTRMFo8zNb9N_gD-hLm
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b001f1d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=B4M9V4KaqHGFCjQwF8YA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EpkpCC9hkgW3BwTRMFo8zNb9N_gD-hLm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXx/O115OTBxor
 zSs0FX50aCt9vQA9O1zZGZycWmkFfXkACB7dJTbL0L32qtbQUD108Xu55Slav0AIGWiCS0C4ehb
 GsZgDx4iXEEdU+1ah0F9zhNOBFUjXRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 02:19:51, Luo Jie wrote:
> NSS clock controller provides the clocks and resets to the networking
> hardware blocks on the IPQ5210, such as PPE (Packet Process Engine) and
> the integrated EPHY.
> 
> Note that the CMN PLL output clock names are reversed with respect to the
> hardware block they actually feed: IPQ5210_PPE_CLK is wired to the NSS
> hardware block, and IPQ5210_NSS_CLK is wired to the PPE hardware block.
> Documentation is added in the DTS file to call this out and avoid
> confusion.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
