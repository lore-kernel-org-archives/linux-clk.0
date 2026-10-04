Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D847F4519A7
	for <linux-clk@vger.kernel.org>; Sun,  4 Oct 2026 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124031; cv=none; b=Xkknf1bU29piAwOkY55jtr4fjbJ29IS4W4eojw6Z06JjDsdAvQqqcuVKVyHtXk2BKccg9vfgWn0HzU4qmO/dAvdBd6FFNCBSz8dTajQfxmCWqd4CMmxBnqadohAizyFfjnuDus2UUzLTw9JmHPK3+1sv2yyLvaBx5P+dFBWUB4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124031; c=relaxed/simple;
	bh=xqXUT9Xa+GEj8rLZCfaBFwCA5jXjiK1BtEgtQ/jOS+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UY01tiA4goqMPLAtpLGaSyQ9fpRp5RKw3iQlchxWzS234IPl0XoJ4R7/KDxm3NUCCazn61itNjao5nU7YQBgCMUZGOBBdhbGgpQ91Da7pihMBerYjAqgReY8yGykgH4oWxE/wToiiLwRBhFpATVaD/KWlgKmqG35WSfDZjEP9HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VF9mydKJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BatkeEyv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VF9mydKJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BatkeEyv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694BOpfF2637786
	for <linux-clk@vger.kernel.org>; Sun, 4 Oct 2026 14:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oxw95l5hoxhBVXSuBzc7Xxhxlw+esRQgJ3Hwhl+53ag=; b=VF9mydKJNDjM7Ltb
	GsvhpgkBzq2YkTJrkWEoj8Csh26ebR0KQbmo0fDeIHptdoTrFxxNRWogqdZ7Elai
	JZeTU0P1650q5cSW1kIgjcZhLJPEMucWMFhWiV6iVQV7dsfPQ6yySDEYiXbp9qrT
	DokSfgOqZd/4SxTPkOTc6sHCI3AfRGS+S80vUpVyePrmyI7a3LVfBEkcE+N3L+58
	OyBV4zFhtnGoXEBnoBCPmotuhufoJmCTbd1rev0tfp8ve/WhIpQ3SEYDXIgcxFvC
	NUXd4PLGZD1CH63a9D7ZFHlpJU+S5GHD52v+UhtSMZEDd1RpvYG/rIgsk/E1Gohi
	+B4hOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu36dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 04 Oct 2026 14:27:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso103815585a.2
        for <linux-clk@vger.kernel.org>; Sun, 04 Oct 2026 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791124028; x=1791728828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oxw95l5hoxhBVXSuBzc7Xxhxlw+esRQgJ3Hwhl+53ag=;
        b=BatkeEyvKdJ5SW195ndn9zei6PSdRuLPVODzAZbSg4WGOPmh5pWXwXtoh6dkipWfXd
         0ZN0A+dp3XY44NSD+qn6kznNvC3F7gLqxl/ZIAQK5ycTopoA9ctii+UEcbZBfANKsNAb
         H2V3UwINwikee/Z3jQXYVYirbPz5yxg9UegbfpemhC3ha+eHJSKWkvkwFQAYGjdUuErw
         WK+7ENJsm8x/SaWRIMugkcGj8CoJVD+jg0W0XW8bKr/hB0cQyNV6wSDcQMstOWjONY3D
         ThK7RiUxYO80ZvppGDwte5a9Xlx0dgAHd4+jaqTTidq6axkUn5qf8EdOo4P2MybZjzWh
         EC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124028; x=1791728828;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oxw95l5hoxhBVXSuBzc7Xxhxlw+esRQgJ3Hwhl+53ag=;
        b=P9ieOrz++gRX8AJZ6XvSuWgnfsN11kzyF0AeJH55sVEWEDaBdkmKm70UJXPoIZnH2f
         nqOkrAfP8kjiyGzTGzXxHLGEMnWKhv8Dmc3ZRVjMQoA/Y5TFL2DJzxgdzVDqXlTsSEnL
         3gh/nR8qbY3NNDAQsQnaDi4AH43/yBSfNbNAKOMgUC1KO8wJtoCy/nEKTGYm+K5fkIxJ
         Yzdr5Sfwrs8CM3qQFOkQfkM4ZRvW2FpCSe2R6P2JSPEjU5UZVqZYqK/KARUtSBryQ38L
         cT3iIufYnXszl8zlsNDGhq4eVNYJ78haZmSsQojf1ZmvN+lwiGuX/jTUAC8h2rRMoAP9
         QIXA==
X-Gm-Message-State: AFuF++k5lxzUppB9wLcAuAWC1DBzshd5vwaUzbEqj4sm7vCpUJHRHTNp
	tYkMBNfIylgTTFi/gsTWSa0RcfejWdNmxScdCtz46/DpWsTaRaveLYCVCsuV8dBWUMCcfcwONM/
	16WmxU2GtJx/X2fYVrdq903MiTbi1MrNnuZzDf2Mw54jBB+1gJRX59JtbNb5fO8B+WXQmgvY=
X-Gm-Gg: AYBFou30hS88bw+q0Ykteo1zSk4opOLUB4YAzdqhoobR7Reaad1Wg9gOY5pcPUAt0u7
	M1pXTgI6/f4kbkHa3E13TWmzfThP4Y2ZURUyoVsIN8Zf+W9cnKhNQz9fiY8EKFndd+7PwHGycDi
	xelVxFGMs9sfstf7ccybSfKnQnhzo7nix1Lmm+CkCQlrqBiinWIm5x2s1awbCKQUfiO5nVZuXCF
	o1Rfsn1jBhQaNnEZYabq7/X1zEPrFvp8AuJeQdyBHOvlUwI1Se+/2pB8HOK/6dqp2pnaiOI9EbS
	xWg15Dk7kEimLise8XMh46fF2bnjoP+yKOaXmpEie09OthxKqul+nUmVhxEHxft0bt7uSf2Hfrb
	uhPx3swHqWt4DzFlNRw16y+NyzVM=
X-Received: by 2002:a05:620a:40d2:b0:93b:d7a2:dd2a with SMTP id af79cd13be357-93e510f55edmr903604385a.58.1791124027549;
        Sun, 04 Oct 2026 07:27:07 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93b:d7a2:dd2a with SMTP id af79cd13be357-93e510f55edmr903599185a.58.1791124026887;
        Sun, 04 Oct 2026 07:27:06 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382fe9cesm19762423f8f.42.2026.10.04.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:27:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Linkai Gong <gonglinkai@kylinos.cn>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] clk: imx: composite-93: return timeout from gate enable
Date: Sun,  4 Oct 2026 17:24:38 +0300
Message-ID: <179112375688.706128.17500624983866321148.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260907022214.1076402-1-gonglinkai@kylinos.cn>
References: <20260907022214.1076402-1-gonglinkai@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA1NyBTYWx0ZWRfXznYzU+3bvOqD
 MItUlbyKTbIItKtPLO5q1aocu5h8vaiU0m1C8pSXNFeuNDAIMT4CUCNq2lriv7VXN5dzunFmRKf
 t9q98rLLheyv9Wx5z0//DmTsmyVvYYmZcTQzkUywrdZcCvRwTfKZLvg1/VLV4xTo4LhC/dR7chn
 nVDiWobFrY7kl+SnwJcfEaxIsXjY58w8qq3aNOQ469oRZAKs3Yp20WQSkb+7yteDe+m03Yiplnf
 j7yqE5Q+nY2wvN09iSFb83ING4f7MJNMDWOcgO5YuOp+Xd22zdsn5bxIv2RLKodjR4h2kn9qo0D
 ZkBNe86J5dMNkfvZCWPCYjP1PgzAej1COwTdHaf+RDi860JoBLorUKT/qnB/yryUivELcPrSTxS
 PvuocSekX/xxh0y9yLSq6THhGMZTskrgcOr6Sql34pTTYCqRdZKdYvXgrhNTnVTNWXI8UxrVqdy
 ZfLdzlB7XnKw5trrU1A==
X-Proofpoint-ORIG-GUID: p-m7JzcoWrcCWy-QQyoMy4NQr90Zfnrt
X-Proofpoint-GUID: p-m7JzcoWrcCWy-QQyoMy4NQr90Zfnrt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA1NyBTYWx0ZWRfXyPAJSlvriHla
 NojqL6hJ/tooqAPuAuZJgu8n4hfSquEBWIxauj8lTntRL8PyuGOPe+JyccqIl/7ylEk6E6Y9c6U
 I9z7JkrxW6WMwduhMHaRDEokmKL5sfs=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac2623c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=H-tvq9QLil3GluE5DRAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_03,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040057


On Mon, 07 Sep 2026 10:22:14 +0800, Linkai Gong wrote:
> imx93_clk_composite_wait_ready() already reports a busy timeout, but
> imx93_clk_composite_gate_enable() ignores that and always returns 0.
> The clk framework then marks the clock enabled and lets consumers run
> while the CCM slice is still busy.
> 
> Propagate the timeout so enable fails instead of looking successful.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: composite-93: return timeout from gate enable
      commit: 246d9fa6b83d2d3c524aad28de1ab5db5cecf048

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
