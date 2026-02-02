Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B182DE71B
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770056370; cv=none; b=D3RSqVl7VAkDOzUqMJGEDAtuxm2N8v0RzdeH3gOBmpmre+T1WESPMCjXBihChC5oTJhFiQTk8goFxMoLF9fq1WKptt+4Csk0XcD3gZdX/G1CO8YpUIssINlqbgIc9zTc7ulQynofSledZ9WmvbYULRVzN31rDVLYLhgNZbvn/aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770056370; c=relaxed/simple;
	bh=a+7P/ZNsjQQls+/UvkziJVxaDQoixZ+gZo34/9AdU8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNmqfmFjwH5tOeV7ycZZXEYJDFv9QNmoGeUs+NCKAiPScNo6jXsBSMu7RfxIDhXCRXvgpOdNtSDh8tRtYLYm24kNWWNblERQgLfOxNdMgytfkPAnSgGv3+nZO+pYkRcuqY1MX0VAuzc+W1jg8rwMCEiWm9FY3nLlrb9a3ouYxjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7n0G7D+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHbkkzoU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7n0G7D+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHbkkzoU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVQr22357075
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 18:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ii0/ixH/O+xz+ye5GcMZOozh
	JxHdclj1uKQw0V46Olc=; b=P7n0G7D+H2V5l4nYFscEytL7eu3mAWuSiO646F+x
	UZetiqWNF+/HucmwKtENcqV1jlPsS+JztNFYE9W06eOjUHAuNtIYCJHG6eUhth43
	wHecV3dxaoowgPqCv9+986mhl1vodg2BhHgf1Dfs/EBv61oMEgKJhlOMqfFdVNA6
	E6rYY4/xSo9NCBMOVA1T/bN5joG3cQmUSC9opo976bCU5oUv/UfPGqT7mBTP92Te
	yE5P48NMx5sh9UIFERFs6NRcYeGV8tzahrlt5YnOmYf3H3Ijkqmf66jejYKfKKSr
	oza+6UxznhCrQxLgNYJEZfz9QU3+8ln3bvit1JqHiQdHRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0m93mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 18:19:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a8c54bbe46so94163905ad.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770056367; x=1770661167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ii0/ixH/O+xz+ye5GcMZOozhJxHdclj1uKQw0V46Olc=;
        b=YHbkkzoUfUh1rE3PnvGGjfXJWaZeREPX1NqVSge6tJGXOwEctuQZryxM4DLtUpyN/l
         1RP5GQFfwjb5g5oJQiTfUrctW3lNY2HyfiF/H0lD881fxAKie2wXUEQM/rxf0VeJUlKh
         kxbKvl/vguTjNEuaCrEvJBv1E+wh1ALsrjGmNvXYXTiB6eXGhowSpsiITBZKFus/9xaj
         qCHyR+kiBysnR8n+394P/pSWUVJXuewGirSzXz3n2Shj+cdpTNTtzvSq966w+jdskYvG
         Hxug+uOKLjVj4J7hybtmELnzEYRBN1ZSj9gp8WezXmyPccdztatvFyvOiYkbVqHO7xfA
         qgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770056367; x=1770661167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ii0/ixH/O+xz+ye5GcMZOozhJxHdclj1uKQw0V46Olc=;
        b=M9sNTcM6wxIQ1Hvbjy8h4thqyIhGZMn0ovIfcnMFIt98Xglg419osKbIk84WvgZ48a
         2uWk9sF/Ln4UUKXVToQG5FDxVXi77F7WNJQXoPlN3LctBXH1KBwcRrf4/NzRFUbQ+h8S
         vsLdW8ayp0iDIZzAFCITRhYtWElWm+gqu7mM9RJvWUA6QB/MlX6sDWyFNm28fute0ka6
         2WgB7BOYgOcTbh9L73toFo2V89c6/sxtAz8aPtnDxPLOEU86eQ0ekff5KJ9iEjRA9orA
         XJhD4sxhqhmC5A01nxa3vlcKBP6wRx7wn9ih8PWzEBoE1ewA1Lo4yj63R+ejOhq/ZYCQ
         1mVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsMga5BNdQDkbU1BeOVpd6pviSpleRv/H/u7A90GfxwUGX1tvgvGIZqKdxpxEFK6MTK7Ui0SFThWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrfNpjpW584TImd1w3ETv+QbmMlD5QfBAIIJjPBxXhSwfg5OWV
	NFsk38m9slShx+kYhL/dpavJePQLxtJy3GvPfv7EGP/gw4U5Lf0C0XbSRiW4nU3NoLEZ8iJBJN6
	MXyi4kZfcHQ6M7k5ao9vWgj8304WtYSjTdMbKwqwWs+hsaie2F5VRoPG4nkSwdyI=
X-Gm-Gg: AZuq6aJYe5jcoA7jRdTzT/mp4ZmJDnVWfsH894IMjIusYMuM2VNGkkEKfNGsIJwBw/R
	soOcwvDswTJn5+2Y+OsS9hRlkViYEJbu9d0bwmQv+/xND4FbB0/HU/iWI9SJ/17G1UDXOSZ83B+
	biljfkcO6jVF3osJJK+P+vNCo2mWHuo6p2reaAVFwIwKW1jPIdnLK6ZiGRePYyyCpbP8OSgsoem
	QjUceGOwMMkBjmBwD6/WeFRcv/+ikFMgyb0cWdCaOPR8gaTeiVRLOjl8t/UGXKazcj+1sMB8IHO
	zei2OwE7iUiMWdksarrFfi0lN3qj5MvEkhEfif2DI0IoOV+Wc9BcEcnLEqmmOrSW8cE/bHbONQL
	npKD9/GQJvo08UEmTIBNx7AVUwPLWwzdoBkZ9
X-Received: by 2002:a17:902:d54e:b0:294:f310:5218 with SMTP id d9443c01a7336-2a8d894cb94mr127379765ad.0.1770056366763;
        Mon, 02 Feb 2026 10:19:26 -0800 (PST)
X-Received: by 2002:a17:902:d54e:b0:294:f310:5218 with SMTP id d9443c01a7336-2a8d894cb94mr127379325ad.0.1770056366091;
        Mon, 02 Feb 2026 10:19:26 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8bd7654dasm126177085ad.81.2026.02.02.10.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:19:25 -0800 (PST)
Date: Mon, 2 Feb 2026 23:49:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        stable+noautosel@kernel.org
Subject: Re: [RFC PATCH 0/8] Fix TCSR representation on SM8750
Message-ID: <20260202181917.imo5lk3smwott2ue@hu-mojha-hyd.qualcomm.com>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=6980eaaf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_u9jKQfyTUMrN_QHvf8A:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: bmv4ksOu5gLOD0LrCG_UvnXDb3Plpawi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0MyBTYWx0ZWRfX7d7H8Ef2Duqh
 73eZQwej+7r0Et0Y+PunIv62plR+7Rg6+PI2SF0amndrd2gLv0noHTS5AQjU/q89YfU+PJW09LQ
 71/6/pRNUo6vP+b2h3AxtLO6rSbHgo6NbOl1CD4z9d20Vp8RtWMmVNrVvwbmSKxRQbkGdwiEZ1V
 TicKiX0R1rfoE5avo7rYesYev70bIIK0tnhOzv4724RCOlDUfuYtWIVSHHDc/1CAg3MkDIvpqmx
 TWrVoPatiASnPAIII23XkukicGWjbkkNkCIFXAL+eqP5m2rcXHA+57hH9wU5dwbs0i6dJanXt49
 QamQRvbF8WmXRWLr3SrWNkM66vNQSSofmuPzI7c61SbwB6je5tyCphvfWHEpzJShIjGVUBdiPvR
 JMPCPBtogAOuVB5sXAAAMSg9T+qQ0RcvcYwXCelVBahp66oginOKAWNORYB/zQLP5Ql4Y0HLHxT
 dmT9MxISfBO/LfSIILg==
X-Proofpoint-ORIG-GUID: bmv4ksOu5gLOD0LrCG_UvnXDb3Plpawi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020143

On Mon, Feb 02, 2026 at 03:57:32PM +0100, Konrad Dybcio wrote:
> As sparked by this thread:
> <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
> 
> The current representation of TCSR is wrong.
> 
> On platforms post and including SM8550, the TCSR had a sub-block in it,
> containing gate clocks used for distributing the XO output to various
> consumers. This is what we refer to as TCSR_CC upstream.
> 
> SM8750 however, is notably different. That same set of tunables had
> been moved to the TLMM register space. This is made worse, as the
> sm8750-tcsrcc driver consumes the qcom,sm8750-tcsr compatible.
> 
> This hardware change had been undone with the generation following
> 8750.
> 
> This series attempts to unwind that. It's difficult to merge, both for
> bindings and functional reasons..
> 
> I think it goes without saying this breaks backwards compatibility, but
> it has to be done to represent TCSR at all. The patches are ordered in
> a least-destructive order..
> 
> I gave this a quick spin on (remote) hw, the UFS (one of the consumers)
> still works, but more testing would be greatly appreciated.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks Konrad for taking this forward, while I was also working on your
suggestion to make tlmm a clock provider.

> ---
> Konrad Dybcio (8):
>       dt-bindings: Move qcom,sm8750-tcsr from clock/tcsr to mfd/tcsr
>       dt-bindings: pinctrl: qcom,sm8750-tlmm: Allow clocks/clock-cells
>       pinctrl: qcom: Allow exposing reference clocks living in TLMM reg space
>       pinctrl: qcom: sm8750: Expose reference clocks
>       arm64: dts: qcom: Remove inexistent TCSR_CC
>       clk: qcom: Remove tcsrcc-sm8750
>       arm64: dts: qcom: sm8750: Describe TCSR
>       arm64: defconfig: Remove CONFIG_SM_TCSRCC_8750
> 
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
>  .../devicetree/bindings/mfd/qcom,tcsr.yaml         |   1 +
>  .../bindings/pinctrl/qcom,sm8750-tlmm.yaml         |  12 ++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi               |  27 ++--
>  arch/arm64/configs/defconfig                       |   1 -
>  drivers/clk/qcom/Kconfig                           |   8 --
>  drivers/clk/qcom/Makefile                          |   1 -
>  drivers/clk/qcom/tcsrcc-sm8750.c                   | 141 ---------------------
>  drivers/pinctrl/qcom/pinctrl-msm.c                 |  92 ++++++++++++++
>  drivers/pinctrl/qcom/pinctrl-msm.h                 |  14 ++
>  drivers/pinctrl/qcom/pinctrl-sm8750.c              |  31 +++++
>  11 files changed, 163 insertions(+), 167 deletions(-)
> ---
> base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
> change-id: 20260202-topic-8750_tcsr-e2dafc2f11d1
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha
