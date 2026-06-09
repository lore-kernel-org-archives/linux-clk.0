Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A22CA4E
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 06:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986782; cv=none; b=EaW1ndjiUIFbleyXsXHzg2rKN58yB+hrb4eRWuYv/7F7btlT3qPdp8YYJakX6B9kd+nCyoPE0m+r4aNK3RkJCUW4TfCkmY8ar1Qo3v4sLnBUbXbCkkcpWEel0HhA8vZGdyBCyhBfvjraGf+tuek1G29vPRtJ3sJRjg6G2UycoJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986782; c=relaxed/simple;
	bh=kl1fmsj8cGmZ4RfCQB2pJXucYwSMi1vzWwY9lJmfaMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyNs55v1wWz0yz2Ea8xc6QtECxCXMztt8YospxOUz8h6xlsXAIdiesi0WSMI6nid2iKNV05FnFC9NU6NVtxWhLQYv23gBRpB+OXyarmTHTa5tER5BBN84Cihfmdt20SL1ePeYDJBP/zjTd5jXi3AKzQwNsNz3qZau4HsYD/IJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BExGUfqi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXcNuOBJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BExGUfqi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXcNuOBJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wrVK1515464
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 06:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M+jE/Whj3i3oRJqpHpCb6TGC
	x3wC4S9R9qh5+UO2Lzo=; b=BExGUfqiz9OhmgpdNx42og25ntWqoKIRs8q5qc7G
	O94UCRivT/rkqKSrw6Ai25Po2dLAhEwORSwO+zmtJcypFwJdt7hniCavd/4NVU7u
	6lALESpaQ9hq2M/cDW6/KyjcDsagJRzf8guD1DiEwG1YlT7yB/VNmMX1IpSHvnu6
	GUZq2n0dCDrOEx0jJU5MnrRfjTt4Jw2uebG9F41tB++mI201eRHLo9VqIUApHTSc
	Uqifw8+t3bwM8XfAUzKbkSE3oQUSFVoOuTvP3tcPVfaM7knSYi7vVDHDWzOO1Ioh
	EGCqRT7TIkmO/yjdqcNHmmXhDXUfBVsnzO8BrvgZ0sVLmA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvcaj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 06:33:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177bddf6e0so1760141cf.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 23:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780986780; x=1781591580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+jE/Whj3i3oRJqpHpCb6TGCx3wC4S9R9qh5+UO2Lzo=;
        b=aXcNuOBJC6tj2WopAkIlC4XWkwlEVdjMSn043YPX93h7m/SFgvbN0vVMruPdsOVLOj
         k7rCeSDVovUK36RJTyTh5RyWDeosZnr7ZK0+7n6GIEaovdzkVYB7EmNMzpYLL47xsz59
         Llt2VpB3x/wnQ6+aFEhuUutb/kRpdLMnGNe0TJbZqUQZh18LnZ4BdCyIFTxi/pMRrRpJ
         wb1snOSlkc8D9IvI8deCPXvY0SfyTnBCheq45fW5Agi8b6LYdgimj81S/2yu9o6APwb1
         ES42R1IRtq46EDPfzOtCm7rqt3QnKXU/Jqua+4t89sXajm8alTvBhCG13TKFUvH+lRjU
         Hhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780986780; x=1781591580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+jE/Whj3i3oRJqpHpCb6TGCx3wC4S9R9qh5+UO2Lzo=;
        b=rFJ29RN0abIvIYZYFbfJy/WnSr9+00YNVxjCFRzURZ7MBDCCufwMaff8J5wHCy8T+H
         RMw5vozkTEqL+JGcQDoI5gHa3pHdNYUwRgQjEyARmpuzA47ILJ3EpUe4ST60m3zqmOxR
         wA+MNvS75eTwWQ94C5wUL7tSFrFBy+46pc11YNywXvuDfGEWqAoj7z20CMJ1HLf8qGlw
         uePW2yPZlAxiIN945i9VSIu8VigYQ5cx3kMFwEu4B6e0YK5YvDFjGhpEET/VL6CSaMh8
         vTKsAivEq+9RlPwgwgPIo1PqhdtquB1TwdV2feHS1sEYiNR6hWMW6SsW8Q5Iyc++2cZK
         9ppg==
X-Forwarded-Encrypted: i=1; AFNElJ852+Ii4GSAmYrZTRsfoO4z5YdCI/6kjnpXx/vBDP0hP76k6J7tdVRBx8lS6K/55S0hhqitIjdYjQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jGpgszT5tiDkBnuL/X92sOiyTHhxsF3Tr3I8kKik/fvM9xqB
	py1yndoYj9sSpyei1BtR8I/hfuldkjkHAJP0KMcK6mLEcy81Qg7c5GeGkvqvlcqQFmdOQKYHUZM
	RDWvuK5cz7G5W8lnkjNR2jV50IIvO4yk8t+H/lDuw2s6J/chePBRkyVUFyLw+hP8=
X-Gm-Gg: Acq92OHPZM0aJ7fuEO9x1XRhDeGN8B8EG634sBL5KWwhKRd9ovWCvQHQaUwjvtrk76m
	9qz4UkOGwO+XJnJVwEXBf5IbjjV/7dx8VKAevpb0mbq169RqiQ2Q4QjPVpWHYvC2uIq49zM9M65
	4aTr6GO/SmqVdnGivMyM6M1UHRtEEruxmDCg+MlohOY5IIaFUt7HMNR1ml4qqE7raubkxc7Se4g
	SAAAcSkONcul98IgqBMo0M+/EbtBn587atODOCIitPMkqrbyF7AfizANz7SWkCbTyItGYBsRJPX
	C2bS1uUtdwhBtuo8G4chzTQMX5Lcmh2NczooCEnuw2MugSnT0fz6q6KQ+kTwb3cnJQldyacGx3p
	zWHAlKLbNSwQ4ux1YOBTjBr18iv6BV1eujtt1UnCdysA=
X-Received: by 2002:ac8:5a15:0:b0:517:74f2:e578 with SMTP id d75a77b69052e-517986c4658mr178930471cf.12.1780986779585;
        Mon, 08 Jun 2026 23:32:59 -0700 (PDT)
X-Received: by 2002:ac8:5a15:0:b0:517:74f2:e578 with SMTP id d75a77b69052e-517986c4658mr178930171cf.12.1780986779034;
        Mon, 08 Jun 2026 23:32:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm58306473f8f.21.2026.06.08.23.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:32:58 -0700 (PDT)
Date: Tue, 9 Jun 2026 09:32:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Message-ID: <5keeetqnhquzvwtpll6gb2sikg6ic2qziuxkpgqg6qzi6q525x@u2taew4tbtbp>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
X-Proofpoint-GUID: AxYfyf0nt67qn3yqEhoSLas5k-AA38yP
X-Proofpoint-ORIG-GUID: AxYfyf0nt67qn3yqEhoSLas5k-AA38yP
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a27b39c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=zgkfINwa37qCbUsG4WUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1OSBTYWx0ZWRfX+2AsEZzZ8D4q
 pz4W4hBGerhVd3QwAWe+qkugkLh2dUoC9zXJx4ug+vCPkuu5703W+teGFdOglJ6rq4g9qGj2YkF
 hXjO0AlP70DcJWGKpijrz6Zhr0a1mK1UYASFCk8CqQDvoz2h4IZzy4YgTK/eN28fqTFnyWIuJrO
 sHlWpgyxZ0JigQEhScZQfWQUK2kM2A0DrUJW6cQaGZJWo7EitptkyuPesQ36c7edEwNNcjB+95l
 7NxAzmDnHkEjqU4C+B0SdSH0NH4qk25bp5sxjX07elZustG1AOWm+gFgkvbbzO5xfT16RFTTA4J
 JDBRJyHKzyDZCUV6s85gfneNB0yao8j4L74v6hRJ4iDN9dvxq7O4jGPNhR8e1aJDLav1HRSca2I
 gVtR/El8KsG5QSqzBVTNvLKD3svrvBf0eazRKlg0YumPksWDeOyW1ODZ7HfH1mNuyEhU2yVLPnp
 J+dTJQ+FSrg4Rs1bNmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090059

On 26-06-04 21:48:01, Jacky Bai wrote:
> Add debugfs support for runtime tuning of the audio PLL K divider,
> which enables fine-grained frequency adjustments for audio PLL.
> This is used for:
>   - Audio clock calibration and testing
>   - Debugging audio synchronization issues
> 
> Two debug interfaces are exported to userspace:
>   - delta_k: It is used to adjust the K divider in PLL based on small
>     steps
>   - pll_parameter: It is used for get PLL's current M-divider,
>     P-divider, S-divider & K-divider setting in PLL register
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
