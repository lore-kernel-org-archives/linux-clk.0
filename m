Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE332D7DD7
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318308; cv=none; b=UPs1qAk6XdvC/dSOH1QkUWX3CGAO3NmAaJlb/v/W5IyMas10IE31Z77bRBz+BzHHqxsJM4exs/HNAww4U0wjWf5F+u0EXL4ND39NCa80ZNs0+88mUrO7iCeTsA3jvmou/5Y8pyNflQ56wVECRcI/BeZgIkaYs9Xf4jmuRnPyHWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318308; c=relaxed/simple;
	bh=9vax4mRv+ZIHx9WFJYIjJgbBCYugCcoMblax+rJ6408=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=om0ZrOURga8RxYwEh6ooVajdBfk7dAE9sH8Y3dkHQxUZ8bRMWdREljCxUb8D78dnB7vPRpFt0cVPOKvtl6rovfHx7fpI3uDclM56fGgbJ8WSpg4x2AoJv0e3d07x/nSogUoVjRG2PBherL/Yu8UNgwgLtBAMqQBQN76ysAhGa60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lnd1Qlzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bKAjitIK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lnd1Qlzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bKAjitIK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CACpUg4025778
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 12:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5JaLhYXw0RSXyl2gHloRFM3B
	UgmsEhqsm6iB6g8egXM=; b=Lnd1QlzmusBjpLTIR+/GkEHqWSbl0XZt6swzheJX
	IoYvkTyAEA5anKgktQqLxsOTcvDfH3pKLaV1qSoIw/Y3lVyfViQNZ0KlsJ/Tn60F
	twGItt6651MgqmjmsaF6fALkQN5iXh0PYM2gRyH2i+zfsfQDxy3t0xRCnvCITUhZ
	m8tVALhoJ45eLO6chu7NDrHElYCIeY1/SxCE7Q80UUDMV1qwlnqJDrCSJJB2x1MG
	7iG1AZs0tJI8ZkaQmBi8SRsokuFCJgXPVapdP5PzQlrBFCmqTrS0t8kZ/OussV3A
	nOxUCeOlswfnEhC9TgJYXYDicH6pwWkyIAe885Jsimd3iw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50t119-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 12:25:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd409so130131885a.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 05:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773318306; x=1773923106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5JaLhYXw0RSXyl2gHloRFM3BUgmsEhqsm6iB6g8egXM=;
        b=bKAjitIKVgTXV5VfxqqPVnkAY0Bw5d0+V+DJ2ufGeYvGm9rmyJ/HR0DfJE8j7YZRJM
         5Pf3ZmwUjNiAuFG3gdLIB65D9rTb7EL/YkA/XguXh8VM99QUHZJFFIahxJuIEu/sQb5p
         6CtwOFNyxGOnbpPgu5Q8T6hu+VzmJ4nWvDlBDvTUEL5eRzts8ZhzEB9jFDddyGTBBVK4
         Ms0INgseVZ0N8KP3nfa91ZfxTDW+TUdLGuqsRvm+Ynv5G/x44bCjzFE+wpGhFYASC7gf
         whx4Kx+WbEReFct/1JI6rjFGanAWsf8ocfapCyRkvB36bIy4WXtyWnSWqIidjFFMYsXd
         iYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773318306; x=1773923106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JaLhYXw0RSXyl2gHloRFM3BUgmsEhqsm6iB6g8egXM=;
        b=dXmGYMof5JGc5Ok0AyzsM53GbtfL20c8FO77JIbJ0YV2juZ223GXAa0d+5My+UhV2U
         o2bRU48JytP1BCZP2l+AUsci4OM7/eEPvwknSIHHGJm85T+L3RpkoqXSv+TvDsCnjbwX
         6UdTGKUR/zSw6weRsmrf0EMULmf+ZbqOEwD7IrK1wmu69WyQx2B2Be8fcVBiWRzlEnSJ
         zkR4F2FWOX2PzfGZlRtyq+71YjxO9qCmginZrqu4XZbC0m8czEGHN2FkAtq2IX8+L5Xr
         pUu58V/JWt2X9UXRJTVLT/lrNJLdsTOTi8QojU1B5ukYmd6NLXGLLBcNK3biKD//KfMm
         qFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaPF5HNc8x5armtqJTLtlzQxNwS99XJ0o1+JTwIdAkKuDCVWw6j2Jhfx6zyMtiYcOChdqzrIn8ufc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1k0KP9jdTE873k9uGrHxdEvl9NB3ihRyXX4Rn78VxQB0NkTkY
	KHSws75dgWtpC5YaaE/LEz8qpW2QIIVyYO1P4avCnIe5HzPaRDEvYMGC/1nqLdNC/HBq53s4mdw
	Tj91Gn0qtnDw52VuUElmeNMK1ZmB4Mv1lqz7k+7mSXkAS2BuWFGKftjFrwXVrkgVaANXZg2c=
X-Gm-Gg: ATEYQzxeUs5BZP+wjzs1HJj/mPfGB3zh+aKOdu1AY1tGtnjTIIJzBVLPWM/qPVlvgxB
	xJqbPF3AHF3XDGa/7C8dMtmw83ZaqyHLqeyeOANOZupDBw5R+h5+OkMEI4mU8aZXKRwgw+428oJ
	XFLEBO+cSNtQ4l5yzPIDy+UenKxsuZ0yQ+hc1/aWLInmFCvwR5obmijv+iZHJYBBvoQIiqb62LZ
	/yroJ0sHNARQ20YEbqnjtUoRmxpilKBLvFXn6NjxIhK2PCDKP6oxU0b/lg2NF7PYegiuIQ4og7u
	3/JfqwIRJfn9fUd7uRBcEHT/0zeF3wwf9VbKfzxE2ycgG1KJnf52aRMy18nIICKsPocm6zb2o8O
	4P1i+5Bp1AUrbVvmVHCFkPwLsEP5MFfdC+w==
X-Received: by 2002:a05:620a:1a08:b0:8cd:8f04:50df with SMTP id af79cd13be357-8cda19360fdmr759623185a.12.1773318305769;
        Thu, 12 Mar 2026 05:25:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1a08:b0:8cd:8f04:50df with SMTP id af79cd13be357-8cda19360fdmr759617985a.12.1773318305164;
        Thu, 12 Mar 2026 05:25:05 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm1048144f8f.36.2026.03.12.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:24:58 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:24:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND v6 0/6] clk: qcom: Add support for basic
 clocks providers on Eliza SoC
Message-ID: <ermbzju56beeuah6u6ezvkeb22c3nriqmgnbaxivfczqpkswfr@bc4ukm4pbzls>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
 <177326259462.44574.3228852589174701354.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177326259462.44574.3228852589174701354.b4-ty@kernel.org>
X-Proofpoint-GUID: 61eMjZc7AlZQVyMAHFioUYhiTRBviUfq
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b2b0a3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=o3WNsQfHC4QgS8L6BeUA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 61eMjZc7AlZQVyMAHFioUYhiTRBviUfq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5NyBTYWx0ZWRfX81QdjdLOjUQT
 sc6kH98F4hihUzzQQm97qdYypf/z8zG90DjJS0L/cRrkeJtA5CNF49klKDoZ2sJMULQke84EuiY
 D5CmbQvS6Dv2ikuYDQXHSZl/4E1xfK+R5A7+bHejuCImOasVcHJimzbz8BaqmeYc1zuTE7KZqLy
 jVnr1+rR5P72DHVFtk+3cC+M2vU0wndx/cQ4bb/xJ6qRnVPgBoyUz/4F1huNr/UQYBTWXaVK1NT
 /CRPLMkJUntvhCKUshkdZ1P/PB1ZQSmVKXjAXnK5Z5IEysEulB7s724u2o4TBz8T3E0qgtWJrb/
 TyddPJEK0zkc9cCIu3PrGCB/zf5NZYNxP7ETCf8Qz9jnfoeK6vC1kV/TZHeLGLW1A/512CoOBfh
 DqrE0i1aN65NwWsnS4HLeW1m9ZMkxCHTbE/SHVzwj1G5fnCkZ1nTADoASABmBwCm8eYqa7+UAe3
 JELMR95tDCt90FkqmrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120097

On 26-03-11 15:56:34, Bjorn Andersson wrote:
> 
> On Wed, 11 Mar 2026 16:46:30 +0200, Abel Vesa wrote:
> > These are the bare minimum clock providers needed in order to
> > be able to boot to shell and have the rootfs on UFS.
> > 
> > The multimedia-specific clock providers will come later on.
> > 
> > 
> 
> Applied, thanks!
> 
> [4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
>       commit: 76cbaa6557b1e685a268f08f892a35004bd4fdd2
> [5/6] clk: qcom: Add support for Global clock controller on Eliza
>       commit: 3d356ab4a1ec2d9b208f0d0020c79855097b1fc7
> [6/6] clk: qcom: Add TCSR clock driver for Eliza
>       commit: c69a586344758f0d9cf0526d2a4b14fb56941b10

Thanks!

But without bindings ?
