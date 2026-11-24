Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485203;
	b=nP6lqsAEortRTfKQwzLEGLIHhnZX/1IErZ2g0rKKVd5p0VbnirkmspD7PyiDkBXNOyNv
	 LgvhybJuotKY4XIyw6V/pwsnp2AgOgG7JBNQY2K+BwICNs07WRY52DcHID5/k6SbBRpZi
	 hUJ6qKCpFaHOtv+VTzA5UTtFI56WAkqWmpw9DweAOu92rK+WQc+ihBhhbcjMfZeoEqb0y
	 1Mz6r7xs6dVkb8/P+qOJvOMd6CWBO1oGBskWyIMBcCAFk18UvCCqwBahdVMj4ke4N5G5U
	 61Dofg++4B/bi+VtFC3es/nrCqrgk+O4pT7VVWiaMaDdR11L1Yya0+C5zUoC8gEbWrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oRzRowuMjTP88VBZ8dPkOyqRLsqCyjmuEpXxgbGUTPU=;
	b=yoUaG8kb/7EAaDopN8JeYJo65+UTIaTmjjdDto+h13icXXtd+4qEtmeUnXroOovKexMN
	 BLrwYFjtXh33Pd9kKbeSriyEtngXF+XJ1qbYGN6LhZmEMdtY3iQbMmCD+EZYenMgRxcJY
	 3BdxHOWzdYgObpZ0SZG9IT0noxa7vt9Mxs7OQCcDw2BC0jVAetsc1+bVPalXEGwsMbscc
	 W8oEPP6MysawcP4Deej7bIWb8BuD6BKnRczEQiYyv6LlHLn1eIJadsq45Kg2n8uTl9Lw/
	 m5hSrmrz0QO5DEn/69wipfUkCYlKstOSyRHJ8NKVjSc2O62v+DCCqeIv2K0o7jdGgVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oyWFdCo8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qv3KtVOp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2479606A326
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 01:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2479606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oyWFdCo8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qv3KtVOp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJu8P73513826
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 01:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oRzRowuMjTP88VBZ8dPkOyqR
	LsqCyjmuEpXxgbGUTPU=; b=oyWFdCo8sTFYiL96gZAcLEAhAZQ2k5+PKIDRjXPI
	HszNWQvihV3C28SYyrUEAhBLYFtXKV6NOjtwHwgJ/SPtm91akqEOoh7nI2eGcKMl
	OwWtWmW3Qzq1PtQ+J4TcBAwNRaLWTLy/cc0dNvIphr6nLJlOnpSfJhszasE5BO08
	careylMaoefkTLsd52o6kdk52IgJ4B48OTQRPeRrDltOb24IjzLtqhA11KNZ5m+U
	N/8mWKtvAOkn9jgxYeDGr9+hjGSi2r0UbuflgVZgYddjrx1zyXVYuJ5l/mQvqF10
	fIMZ5C/5jlCLbfU3fBRIybi3Ou1MVJKAlPlzCX/2utNbeA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr96qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 01:53:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so4402423eec.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 17:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795485201; x=1796090001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRzRowuMjTP88VBZ8dPkOyqRLsqCyjmuEpXxgbGUTPU=;
        b=Qv3KtVOpRT2PKBXVaSrBR1xiJlneqCskhka8p7rN2jp51wJmpdO4pOUycpy+wIJvxi
         zunZ0lKBoAZVp3hR9zTJqesIhVVxUVGoErjB6Tygmx3kaB6CWyuQjupW/nEZqs0FqAEy
         3NpY8D64HItnOCMeNqIXhrj0Hc57HHhHmKs68K1aDjP5KQlRdMgcHU0yOdbShSzP7N+9
         fDYOq88rm+mYXtHSJ/rJCPeZ8VYCnfafb2a5wnDRDM44bOLmBn57wqiMfB9IV5xL5aiW
         wanwvkyZvOsCFgo0y+9pGxnMjqvVzmz2heUAGVCeNeuoua2X3BCm9yCfBantAtr+YPAg
         7tAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485201; x=1796090001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRzRowuMjTP88VBZ8dPkOyqRLsqCyjmuEpXxgbGUTPU=;
        b=PSc0Xcdu4GK2oKYxcBa1haY8yPQ1DsTfDjJTo+pYHP1yFs9volZWSfI5SaZC9GGPzV
         zR1WzMDGvBCfGX7onuQZtlgAowt4XpkPbWcwCLHYNgedxixVr6J1BxepSBSKFmcQCHJH
         4RRheRFM8uoAixIqh+ddFiDS958JnNxBlJHC7nLf16bM3GCEanQaqW94Y8x8OGyGvVg3
         hQw+Jk+P3+k5MCtgE+eT/U/Mc6FojYcK/Fk/ULYC+XD6ENG563TXch0+yS67WKZgx5cW
         Bja2d21otXSie1POv4Cp29DATlggtYX+5ff0jiV1UQgMhFF0TNTgd01kqB4XbXDk+XWb
         O63Q==
X-Forwarded-Encrypted: i=1; AL+hErE0oIkq/zk7joirpzgZ1bX6mErJHGecFEF+Xk2CxSujw7Wmexr+CSvv2uSPZyxbeaIKXRcFMbwd6EY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eLCOlQEB2yRtsI8MUGcmKOBq59kntKd1KdiGoQzoBsodbOwyV
	13z3UCFfmYwB4t25S66PkhHVv7OE7G3+N+p1zKUozWO/ojHMZcLSJGVbDcgRuCGl/oW2dYXdh0L
	4tAhVlWiKd2Kszn4/jim8cvSEzBTZzh9uX5bofWlL1NPSVedqATTk5rPaJed8ikQ=
X-Gm-Gg: AZFdTZe+ALUmVOCI3taxwNsZQnIw4UmiO7SIpUvd2pneiukb6ElAzxt8khTeJj4/5iW
	gbLT3t80Z3MC1ygZiN82GmMZhE1kSSd4PzkTPnb/W2k/tC6VxB9JGX9KlADdUdJY7KEtdIQ9kDp
	0t2+wqDNeafRBLnPoB9pXu0ojUdnkvuWmqj00myXr+ZQ4/wUA+u1SmzGhL+nPgbdeInee9K7OTC
	uw+9R/0oYXptgQ+rC3FpHyb+cgxoaB1FGSPfbe10WMHG7urCrk94qjcqEgf0H/FKr9rCOd6ozlQ
	L6cjwttcDx/g7+WcjT5h4mX0QU7CPzL38KwJVdh6rdhRuQpjcAY3v7h9AyQyaWHut54kEz9Vmlr
	Yu3jNGA6fGSjuzAGUGY2VHV9FAY+ysXwGqAhLWQatsMuXZpenro4ipQ7vqBAmbJke/Rx07WX1VM
	kYUQLUVZ7bYctDdL0=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr14798186eec.7.1795485201276;
        Mon, 23 Nov 2026 17:53:21 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr14798165eec.7.1795485200733;
        Mon, 23 Nov 2026 17:53:20 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm43160022eec.14.2026.11.23.17.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:53:20 -0800 (PST)
Date: Tue, 24 Nov 2026 09:53:14 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: apss-ipq5424: Drop unused qcom,ids.h include
Message-ID: <awTuCjZhZKgGM945@QCOM-aGQu4IUr3Y>
References: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfXxXibr+6bGNB9
 9e1Ztfs+dEYSeJ+0TdSw7B87DwIDpP/YKz4A8eG+Pfc+88miWUfK6/ol9F2av7xG5wEGgn9A9Bl
 wyDvWn033DKgZzCVRxpnflD4yQfqqj8=
X-Proofpoint-ORIG-GUID: EuuCZqykPFK-GaP1dBW3MXHxCLjcTjWq
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b04ee12 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Cr8ZdchctFYn2ypy-6UA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfX2rwqw5r88z8C
 cQUHqensA/AGS1iclfg9Cfcy3GV9tdoF8YUkV+qpC+63evebwwsHTc6GFaB6rTmR2soUgbff+KK
 ZJipAbj3e00OTBaBLa5VDZCQfekakjeXG0Xxo+mg/QoPGioYyYhkdSArpOtsKwKd9WVUyG3M84W
 qd3hZjYzzTtxpmkJoAxZcq85h/IN2ilCrRk/KnsZZTsP6NUVkyneNF3pPJ25XPZ3YJIIMO8H28J
 iLtvBHGbG98nRWcaNK6PmH1itLhaTsbag2wINPVok+tCq7uu7rtvPZT+TDVi48nVaQbo7Qb55za
 6CdYgcQBKmkppsp0Wp3YLA++ypK5rmbfSugwAMGV2X8DYNB+vBaS+BHcVxsLIhFwP2r0bjbkZAv
 TIMydu1//dliFdAXWeM3E9gKWn4BK23LCfueDi5PnWqkVOCcxuBynyweeGWnFTi674NulEg4fIG
 Y5ZTZGk50wgws8gGx8g==
X-Proofpoint-GUID: EuuCZqykPFK-GaP1dBW3MXHxCLjcTjWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240007

On Mon, Nov 23, 2026 at 10:58:43PM +0100, Krzysztof Kozlowski wrote:
> Driver does not use any Devicetree binding from qcom,ids.h header.
> 
> Suggested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
