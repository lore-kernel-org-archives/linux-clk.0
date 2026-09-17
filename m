Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DE9552932
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653336; cv=none; b=QPdP1IkSwuPIQJVCNACTqhcCOeoPwC+bk+eXJYZ15oTZ8Q/4egs71FEHCaE74yJHXp8iaTmxw7MtHO407bu6F1hiyC8x+K2YtZrz//vNT0Iv8iKLqOdtbdZkxknHJbKyinKrdyVBrb30AklFxDi0G+wXBqENUMMPWY4M1oQsdYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653336; c=relaxed/simple;
	bh=x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rXBw89fUzMOtVnwgJRGsOigBBHrKznFXs1R04hrYo3oCTsxLNz4LpC0u5tvQmDe2GEMsds3KKrsymuZZ3Zp+aTXKMOc0a4oTQURSMxA1EHSbZmr4xpdIfxqf7kIOcqpuhaBT85RqdRp3nfO7G+N9BbANIV6U4ApEkZSkuJwnBL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8ac57Jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Reb+1Udo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8ac57Jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Reb+1Udo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDitDD1821452
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 13:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=; b=d8ac57JvkjcF54Yd
	2ivhXqRcpnFbhX/acgkvMWhvab8FzZfMcpDcKeGH6k0YLhncwk+vZsmwnFDHycXj
	au12eclPKbBlHYpBxbgPhimHzv22QE89X3FSHRWZwg29Ol1mnmTqIRrtGLazTr9V
	pD9TbiESQp9HkhK/qdZ27cAqKJaVpdrhOHhkLun4HSECE01vjLiHJXz+GwazZ7Cq
	nihkHh5fXeEzArc9LrN4FOO59fyC5w4UM4S3ImpMh/X7aThfMLtiJpu6NvlpqYbF
	0fARxvfK61d1+NTR1Jtck9erM3CyL7vN4mBZ5fL6ewn7YMHPsb7pxw0KeHoAMex2
	M17KWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdfth3vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 13:55:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1249779a91.2
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789653313; x=1790258113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=;
        b=Reb+1UdoIuYU125ckbNUgp3P8VH2ZvCGt4faxZ5dirr2miYByueP2GGmgml4OuZvNg
         JQX8LmIxVrAwJ+1LFURLTJsX5oYrqhzMK+MyRN3auxLAipQJ6v7qPfeU8VxnsxtcC/mq
         c6ou1bl/pLJr4fhG3/+F54psZyXGpr0vkIN5HvR4p1qCm69I7d05vp+BikSaOcDYuwV8
         PyVqeDi7KOvFgcDkXKMiuxyh66gzVAFL7ky59E8uZ714IJ1P8i+ZiQO8jOtmL5+nb1h9
         S7yNmGrZzygFMp9sTp5o8rn9FoUqbDqWOWKXzGxNkFK9fY+AHh9k1c783BTdTrBB8DNN
         Rj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653313; x=1790258113;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=;
        b=gg5GPXNAf+Z/0KC5U8ID2FUqtkCm993l3/ItHvhsPOrgkPaZosrw+Wthef6dS4SOr9
         x0n2gW4Jg/CT5EuSbU5v2FjkdQ+wwrAt1Zjb79DqgtaRFfCPWiCmu06tK1d5H2s9klmk
         oGKXRgKaeJVCi0uHKmDH0qBrwzr5wPiiyhT8oOuz8vb8E8Inn8RVHoiBxDyZpe26gHYM
         n2rbTbAZhWz1oayesB6fekl9rRRf7Rm9Ea+8mIgDHGO3/mORx20KL2KM9qAdVilaCpnY
         iKql8+0z5SjR/9DllZe3sweglx4cIT2TB71egjC0CPy1t0hqkW6n9rCsrKM56iiF1ZXc
         L3/w==
X-Forwarded-Encrypted: i=1; AKwUvByMcSdfgmhP/ao6uczxipcLpGUscKSRuQz5drc5tjL3HpPa61ntqoxaIog8PTph+649QL88rKSeavM=@vger.kernel.org
X-Gm-Message-State: AFuF++kjFwRXwUv7PSMJ4WAmulTGtyxOT7OpubsAmT4NusPSlpNK7lJH
	sSGGQRJiwJhn8UVn/pQTwpNMJ2tI1BMpFJoMhJ/GTEBMu5N8M90vVsXnNCPqWbwtd5/ar2/Zaqe
	iz9eCn7M2dBH8P3cI32lFfD2bC35zQH0d+Co5sP+Bjll0LaHDmLumBw4w/0kJKNY=
X-Gm-Gg: AYBFou0oWuqa/Vv8rDeV5HXc5KWw805dmgVNS544T8jCNB+iqZLlaQfniTN8O2+mS6f
	GwRwOVSkNnaVC3PmL1574qJwgbsTgkIhUkWTz/fDNAtr0cn3XHzUg07QxTS9HOhBFxaCpRGVl6y
	jYPDWtg2B7XjLRXk3Cb/qNCB0BB5whGX2a3qGImIQ8ZNDBA0SUf/fNAGxLJSwTv5uGnl/LuxX3d
	1Ww7qqYhDs3xz7v+asKpOzfDIap+n8wTHPXerlS9jNxAf1xKMyMvrkA9yyKBr6G6sdXp39qi7eM
	rJlPj0suUdmy2SUapT2PAaX6tvmC1xK4x4b+jqUE11aQ3YVt5m66mQAXocECW9i9u8DDJlbuJpC
	rbb2oxGUbuNrZVfdO7w==
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr23561377a91.20.1789653313111;
        Thu, 17 Sep 2026 06:55:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr23561269a91.20.1789653312596;
        Thu, 17 Sep 2026 06:55:12 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d771e5sm14083961c88.15.2026.09.17.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:55:12 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Thu, 17 Sep 2026 19:25:09 +0530
Message-Id: <20260917135509.2760476-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dfcdf1bd-540c-4294-9e41-1dfd9ec16be4@oss.qualcomm.com>
References: <20260831-heartbeat-v7-next-20260828-v7-0-e3ffeac46a51@oss.qualcomm.com> <20260831-heartbeat-v7-next-20260828-v7-2-e3ffeac46a51@oss.qualcomm.com> <dfcdf1bd-540c-4294-9e41-1dfd9ec16be4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE5NiBTYWx0ZWRfX6JLw49z62hWP
 wDTNwZ9vomTHYtZZpKJ1/HGFeeB/nEbzsGnANHy7ZixWREM9WvDnID3jFCvI5zmgQ1zzfm7M7JP
 ksHKb6CDBgyHv7ptIpFewRsv/KgmHy5WuCnvvYYu4P9RtJeyGXGJx13p6DgqxDBjiJ30+kCzCYz
 woPrOFfSzfMovL1zJPaldxxIOPv95Kgok1RsmeFahUMP6awoJUEqlOuIHHw0ZlkMe90l8phBpuP
 2pvjkyM8MpF2+L+Cq2C6IlaCUA6/B/N3uZT+rJo1mzyIC0OIojyPgnQX8dXtA6N9tWFQEIHezEj
 biWNx8A/6wuLxeNZXDgbqk7eh3DymWTGnDjCe500euigjrNYbvsJAHlQQKQLeHB9UuxfQvEcQ3s
 fwjgD9Id1n3+xEl65t73nIpuubFtbb2xiooxH95rCPc0p9+KMBSceqczGVVJZLDHMxv3L7Gkbt2
 gzuamOVy+muaw5Dqw+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE5NiBTYWx0ZWRfX6A+qqyeEXAZm
 VCfyKpxQ2ktdm3dQDU07kyi1dntlumlzMiThxThzcZV8ae8UA82fpjc2Bo1StPqepna9HEmBWB/
 DGQWNpFb8wjRisIdyRV0NzhYCrrobXA=
X-Proofpoint-GUID: ysc17WGeYiYvL1XwmeqPkVIMh4QXazGB
X-Proofpoint-ORIG-GUID: ysc17WGeYiYvL1XwmeqPkVIMh4QXazGB
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabf142 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=1oU9jGvioK67i4IjZRMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170196

On Tue, Sep 08, 2026 at 09:29:27PM +0100, Srinivas Kandagatla wrote:
> Does these two registers need to be written on every prepare?
>
> if we need to program just once then we can just use clk_regmap_gate_ops
> which will implement pretty much the same driver.

They only need to be programmed once. I will move the counter and delay
programming to probe and use the qcom simple regmap gate ops for the
enable bit in the next revision.

> This check will never fail as the device gets only probed if compatible
> matches.

Ack, I will drop the unnecessary NULL check.

Thanks,
Sarath
