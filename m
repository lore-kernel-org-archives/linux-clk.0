Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7929430BF52
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026716; cv=none; b=GRBajQRek7Ev8/1549NHYLG4vB/+eY5azcwDrtuZ1p67Fxnk8zRLO1jmkiMzh61L3d5+zCuQhXDfllNxKF+fUCGquEZXoTxj8nzQcO7TOoBpCIukJdRE1aSSqH4XrsomaCHasve3enX4LLhDBS+0K+YsRa/9XX9kogKqd7EtpjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026716; c=relaxed/simple;
	bh=PFSNKHkDRqAk4wNY1w+yqF17MR3wYWgaSnmG61Si2D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ae4kual2rkPE+Szrqh83EXyrcEQcKRuiqob5ljvFE+HLf1sN9q47YmzjlP5DwfqZjlHuSNaXfcftcP2XcrUla4bZe8TpHX2OgaGR1+D+sl190wMgKlkXH3m+TEQk8X+CyjGqBGG3gae7uhyz5oPLq0GcVWUPhEv0tgGLDSIOtno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csOifIal; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gguhBx3h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="csOifIal";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gguhBx3h"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O5kLZ71959136
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 10:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i7lzMLCsxmoXkNQBIxyqcDtQ
	NL6NkENWGxEGYzBdtYo=; b=csOifIal/F+WCvB+OdV3zRpW0qRS9zdJrROD8njW
	56qSJZN05cYRXPHUTZJw9Nwlaq91MBTfUB1B3VWvY/XXhk2Jz/HwVERj2aIJMUIW
	IqosS0Vumc86e7iaVx0GxEgfT7AnYHMWP+8ztBuMZUpuBws1fHUsh2EmqS7u3UVw
	v2BvkGNT+7PWBODuYCcs8p/829nErjaaY/Uyu4mJkusAzDJFAfwMie7c9eAXcEw/
	VkRyL1y/q26Y/7l321r2vtLStB3frRDcTbRQjR/0HbxNM0IQrqkZFXOcolAxVDvw
	fuRv/sx04/8Gj7o+yF/6wtbIb6RaILgetoRaaMdbiy04Ow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrh7h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 10:31:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb007bc36so116938661cf.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026714; x=1777631514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7lzMLCsxmoXkNQBIxyqcDtQNL6NkENWGxEGYzBdtYo=;
        b=gguhBx3hNWXk2yKosyKqgfCdnGljKMCzn/apu7EQSj9XchCgw27w+30tUG6IiXd9HU
         SCFBiHkJRiD5sZ+cVqjMMqut+1Ik6jWqrGLTZBLuHadsqW2tgJu2JY1up/X0YzAcKrw7
         rg6cTbTQ1Abs7JvN9FlDClmdthJElnjpd6KiuLDwz/ztrqjETxWxh3oFzhfSQkKxXYF2
         J/MUgAnIbXBjyyOxR1+Rj08QF98KUxQUHuIoYRBBHd+8XvAe5fKF4mJdjWg4+V3OuLqs
         1dQyT/3F1yGBZR3ViS7etOoDCxTflHki3slhqSIxSKCb/7PjA8i1nZbbFcqFCMYdKkJ1
         Du/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026714; x=1777631514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7lzMLCsxmoXkNQBIxyqcDtQNL6NkENWGxEGYzBdtYo=;
        b=QRpnctVWfzInvPVpcEhN2k0nnOQo/exxzvN/30L5HDlJUkzJuc/egcF4mzBmRquIKw
         C/a4QRlhJ6v4GwyizOdTE8rqQHe2+01GJg2HmQ6xR7Vq/aikNtkIy6f8gwysLwAWl0+1
         HWYS+wVC5HnrN3OxzkYspDmJPS65XinTH2gok1eYbfcQmg8JW1rAlELceMCRx2cs/eaY
         xhoZO1y9F+yG8ksnIuncVMHhTdAhcIbPAsewbLQLP0Yk+HpeCeJQ/58OWzKtJ/JyZY2o
         +qB2yJ/dRc5P3oQ+7Ij2RgS9x9pt+83b/lTW/KQDPtCnEBmqh6SDJD61r0NuB7XmPlIp
         xDbA==
X-Forwarded-Encrypted: i=1; AFNElJ/zy4hN/iErdOomEUPFAlrpXz6xOSO3Imea2EE2VrlEJi+QZ9lohpQhCgm4DG6pIDJUtisVoJTAfBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVCZT89nCHD4UE1Lm7FGovlSANdvRKQtMFsDLs5WccRpKiWITQ
	7zGT0RjOYe9LpwHL/Try814DvlmWfjTvYhz4IYn7vTEPYhbJm8UTQ/HTcKg0t9RlmwiosdE28PT
	cY8U3MB3EzP+ZpM/GN6rAHdcVnjaY+b6UaPrzY69Ugi+FJDaDq1DuDvav+jDyHkI=
X-Gm-Gg: AeBDievVpZskv2uEDRVwGw14fl0arPGfzDNBsHBqKyVNiWL8tzBwudARn53AGgRUw5m
	4MYE4SpIn31SJPAZzSZ9B5LG4HWg9l0n3Z4VNByNe6v0Xyaiu6xrXIYc3fVW4b5TLQ5Y5txYMNM
	bS/zdEfTTETT2Sj9wPhB1ZUgZbQNV3XTeQ/V07bEJp7SEGLNoas5/uBg3YXWxcETXK1Z9rB5KU8
	Z9DU172JXTCn38t39JM5KBzJFQWi0+HrhlkZDAftCeP/azUSi73vPG620CuGS2VfPyMmUh8mc6r
	IxgY4EXthUq8Xkz3Xsk9PPaDZu1mG7EE1X1QpTS+JDAhU8otfb6CFc4E1wnH3228pQ4v6ERvOuO
	rlUCKsmRU+WaXT+bpaqXXH8TA7JkYS5cQiR14a9h5MjDhyIltvTrsBaLg1g==
X-Received: by 2002:ac8:5988:0:b0:50b:4eb9:a97c with SMTP id d75a77b69052e-50e36bd6e6cmr472707561cf.15.1777026713726;
        Fri, 24 Apr 2026 03:31:53 -0700 (PDT)
X-Received: by 2002:ac8:5988:0:b0:50b:4eb9:a97c with SMTP id d75a77b69052e-50e36bd6e6cmr472707031cf.15.1777026713262;
        Fri, 24 Apr 2026 03:31:53 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44123d23e0bsm19799801f8f.15.2026.04.24.03.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:31:52 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:31:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8450: Add missing CX power
 domain to GCC
Message-ID: <wvadbeipr7cuw2vrvtwyaqlarxklp2squgrzrk4wgq7thacmxk@v5gm3e6fbvtv>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfX4SDc3w3C5nY6
 EbFnP3OZFPrJFKNvNqKE+TzzgIOFVQhukzEqWidqrvC84IJs9ZuTOuov/cmBt0/Boz3HiKyZPns
 oxohMDX3KaqOPPIsINVlX/ssMgeDmYAk4GUNdZ7XTkk4HNO6/jSkHW5/4mQCYDPBqGhOGvEevUe
 FvbtNlsRX++TcRZog1fosLWyxuORSPlxN4wIKlCrUeb0cKOzNs4A8V/MHa45JEy9PmicXeprFCT
 7q/biVRMewlDFyPKjWJ4FzEyiR/MkinH1hIrQt4ByLIPO+l8+yH/rOHVyLXI1tmiPCLlCYTaZU6
 7PeFZe6scG3bzvpj3zRndeNOgNqBqb1LU1rtMC9NYeKxtc5oacZKcw+U+UWrEXhJ4GzBHx00J8G
 25g9Qpx68AdRw/gZuK84KnRAML7QmIJU8lJaMifEzixMAb6rR9L2dKowwcAKhb/hv4tZepvpCm/
 Bv6d02Vzoge6QeGlnHw==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb469a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VMu-9hRqFeGcK-ltHv2mkdxGXXHp1qBY
X-Proofpoint-GUID: VMu-9hRqFeGcK-ltHv2mkdxGXXHp1qBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240099

On 26-04-24 11:07:58, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
