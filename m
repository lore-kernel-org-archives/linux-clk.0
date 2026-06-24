Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4A92F531B
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 02:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782269570; cv=none; b=n/M/sGdDyja2jj6XZsJiqcWBeDa02/TVZ+lmFqXcGU40H0OfZ2xVuFBd5Pih9pqnvX70Y+3ntp2yqKffwEdrgv7dqdUKNKmBO8EPLSMM7GOEEG62NwKJ/aK1k1wllPdZ4NKBdVmoNTnpBrgeBPMdoYQ/gnrnpzQt/M/9HHa76ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782269570; c=relaxed/simple;
	bh=bBlGup/0k1wJPXjCKs7wZksgmVerSByXM9AQ54qmiF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXFXB1MiMfnltu2HxkMnvZ+al2Ra4j+uK3iNDbZ+Bl1qRuSn6UlBAmrL1aydHb+L/uaSf5K3AymTuGOar6iMPFJJxbayd1WRS27hNK7gQ0UYTrYSxbT/02QAcLI+z/TitrgUJyCrr8kQ0J9Ml7naNIh4kGavtsTK3erUoOJH5Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U97jDDrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eU8zWqtT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U97jDDrb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eU8zWqtT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O1T3q01386864
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 02:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6/Ji7vHvoP6K3FS/Vd1DP3XU
	MbNO+toH83x0mMRoiYk=; b=U97jDDrbFjGSOyQKNKMgTYUROgj2BfbqtykyFqYd
	0KhDifNetDEH4Bmd2Hg9iwR5D4etqi6CahKAhHhKJwIX9XXzfhjdQqVfz0RzMBu/
	+BLrIMUs1hxWrifeBRusyS+guXIrEdnT+ybJ2z2Ird1mcm/9/IjEAZL/9OniSUuz
	Q/rdKlKUmaELw7qCSxefEXQDGOlWTTJ1CKTOYeepktirZgDTen8KCnlAhe7HeQS4
	8vnYw7T5RmQN8kbZJLu3keqPnKepnW1PBrIQYt19jn596r5h7VuUE+Y76MxnFjoV
	nQ1OMhi7C1Yhk1oEGo585JxlR0T6dA2XrMNRuR9z0CqELA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00ev92yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 02:52:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ba395b047so1561737eec.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 19:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782269568; x=1782874368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6/Ji7vHvoP6K3FS/Vd1DP3XUMbNO+toH83x0mMRoiYk=;
        b=eU8zWqtT6lxEX4Dl4rcrVpgz9f1yzZ0zl3CIAWeHFxBOSjqAv6XP9zzmmWyOg1IjqC
         tAHU5Db9DzLi7olQN5tVJIKap8V+Ivt+yx3XQcK9P3nhvdvTwqePtlXajXBsVr0++Ahe
         d6Uc+qqcq9RhbFnA4tX8VUbxkcNQgbSzsLRef3Wnc6dHQ/9LYexZs3oIzf3cl+3LGyli
         4AjAI954qHQZ1qh8Ela3secBjy0C0sGM1YPA/yTz3AWzBezhDhqJM9aksFqZht0fxWKu
         pCLM1mEiVaSPA8fYPbHOPpyWWWgoG3cRO6Zf3QFApeSrOlto64rgkHIaxxGNdGPSP2G3
         VVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782269568; x=1782874368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Ji7vHvoP6K3FS/Vd1DP3XUMbNO+toH83x0mMRoiYk=;
        b=Ws+r4KfyMcZMV4tu/cJDow4FLdtiyWqYY64YnnySFxpCZt92Y6RVPxo9hD7iYsqe+B
         yGpPLgJ/hRF3lyBW1YBluC3FZVTDdCsMdI0K+5eBUj5cYEMi1Rv4p4x9bYSpJGuA5PRR
         gkmNgcYrqttSgB+sjRyarb2t+YTRfGF4DGR5xO1ZcwyKmQBXLmXQD8bAXpYh5XsPsUmL
         BEwNKYRhNEmldSjNQZf95DQt2rO9eeia82ibKth9r1FFLVmI+C7cNnIlVzoF8owHCXJA
         ++b9Hwt5YkeetpBeX9j394S+posbfCN6q2Y6HRjgsLUDzQ7YLY+BBDagrNVHzHF14Qi+
         pNNw==
X-Forwarded-Encrypted: i=1; AHgh+RoaflCUdVNspe9PvoT8SpITzL3N1G/hPc0VC213eaPUktQPNsBJM+xY8BEU+88jXP7CkG94+x4A538=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAReZtQ61nABr/i5huV6sfwUa0y7klqUj8ak0qVcOJ0Xib2utR
	ScxpZD5rThfaZ0psmbfpZTJDKcR/iK72nfCuaxj+QQ35fISohFJg05m88w6joY8/wlylX0/TzyJ
	yUD4FGIo8pYf7A6yhskl3nM/hHsRrsOQoVezLIjxhJzrtl4bf/stWKMeGWTkRdQo=
X-Gm-Gg: AfdE7cl1imG2jTDpytnIDTmO8s4xOlsaNL/5JLgCeA79bG21foFWRdayoVe9ZPRHD4e
	mgAgIq6mFF1o4QM8y7IquTZqsKF3gNhZb2nNdvcYk0Tps6Ho7zCj6Lj0XXI0porTvm4uat027K/
	p0X0eadKeGPdTRstTO4vV2aXBC03pO/Ml4d0n6xLOm8Gr8l+jVPdLYOv8z/VM+PVjw9Rc3f2dix
	CMpVQjuiwBHzzZ2wmPEow8wvHFt/9ZdVsPw5rrHqreafOmd1LvVlW7f3GpOTxmzY1prvwoG3JjW
	njoFBPuvN8aUxfwX1T0q6EQjQK/hBs6I1u3jDOCFIFa5byW78csSSBY6axmXA1gm8T3aitMz+15
	Ugu/lv/S6DmUbALw6KyiAT6CSpdrSiEslNRDWCi3ANRgXPbnsHG3cKQ==
X-Received: by 2002:a05:7300:cb83:b0:304:ab8:f899 with SMTP id 5a478bee46e88-30c68c9eee8mr1693505eec.8.1782269567517;
        Tue, 23 Jun 2026 19:52:47 -0700 (PDT)
X-Received: by 2002:a05:7300:cb83:b0:304:ab8:f899 with SMTP id 5a478bee46e88-30c68c9eee8mr1693479eec.8.1782269566982;
        Tue, 23 Jun 2026 19:52:46 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c6f4993a1sm185163eec.17.2026.06.23.19.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 19:52:46 -0700 (PDT)
Date: Wed, 24 Jun 2026 10:52:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
Message-ID: <ajtGd6OLJeK_67JS@QCOM-aGQu4IUr3Y>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-5-860c84539804@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-nords_mm_v1-v1-5-860c84539804@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDAyMiBTYWx0ZWRfX/xEnv7YFmb8R
 AgLaYfF+XjobyYA3eVUlF3vZQAF8LzAlaSuLIIhNavYU6kSrSH8uzOWpV1JAG627skP+EP2Yg+w
 BPHyKi97cSnhyREPQJ+mLym+egSD3wCbdm5tBtkUHYrUy5k7tWC8gedeX/T/RfkD29SlLZN+vk7
 l3G8hVv/hAcwdoZMhmHkSJugzOHjy6pPV+yxpyXtvtwOtxROPzdii6BE4Re/wvhpz9R3FSyBMY4
 QkXdWQ2cX+bH0d57mG/CUHRqVzrui9RDIQGgGg4rXZuo3+W5B2cYNks/UvfD2FPAbDYnVJymWsQ
 L6RCRcoe9YWtdr4sQGuga3hd0CXaCz6zA9DT+rYHvzq98d5jErOp6PtSbaaDFtMI7ykisewaepD
 Pxv3xXBb3+A527/pOZ1XgdwTPQPWwO6XT8DG4GhLsHKS+UIQfOLdWEKza72cILAC5/Ji6ZY42Mx
 fCCn+FFO/b+sfLay+gQ==
X-Proofpoint-ORIG-GUID: 8mC1u-UZuTdCz5fCF3qt-SBCdTOLYl2w
X-Proofpoint-GUID: 8mC1u-UZuTdCz5fCF3qt-SBCdTOLYl2w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDAyMiBTYWx0ZWRfX7PfaUcWtdtWX
 XEUjOsD5kxFfLKrLXvTVcXzUh8wcMLKbV1B8G3j4FLAcwKTXZA7kMru+pcieWzcjt8h284DJbEV
 kZSWJuN4I44quNvDfOZXYR378xOxzPU=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3b4680 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1IcVdnUytOkCmWWg2wsA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240022

On Tue, Jun 23, 2026 at 04:24:08PM +0530, Taniya Das wrote:
> Add Device Tree binding documentation for the GPU clock controllers
> on the Qualcomm Nord platform.
> 
> The platform includes two GPU clock controller instances, GPUCC and
> GPUCC2. Document the compatible strings for both controllers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
>  include/dt-bindings/clock/qcom,nord-gpucc.h        | 51 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..ba85692240e07a4ed8e69c6b61847c5601b32fa0 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> @@ -18,6 +18,7 @@ description: |
>      include/dt-bindings/clock/qcom,glymur-gpucc.h
>      include/dt-bindings/clock/qcom,kaanapali-gpucc.h
>      include/dt-bindings/clock/qcom,milos-gpucc.h
> +    include/dt-bindings/clock/qcom,nord-gpucc.h
>      include/dt-bindings/clock/qcom,sar2130p-gpucc.h
>      include/dt-bindings/clock/qcom,sm4450-gpucc.h
>      include/dt-bindings/clock/qcom,sm8450-gpucc.h
> @@ -33,6 +34,8 @@ properties:
>        - qcom,glymur-gpucc
>        - qcom,kaanapali-gpucc
>        - qcom,milos-gpucc
> +      - qcom,nord-gpu2cc
> +      - qcom,nord-gpucc

I see inconsistency in naming between dispcc0/dispcc1 and gpucc/gpu2cc.

Shawn
