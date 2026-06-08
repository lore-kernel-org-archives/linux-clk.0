Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC242F28FF
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903662; cv=none; b=j45qbKqbEZvyb1N5dMzdNFcNneCisG/cKzwJU/CRYHqyRe+qixTEvQnWPEz2/PsdbmuuvfHxUgPp984Z87I8ZL7bmZi22vWzCSXXQm/E68YN8EAcRxS7jHClQtlYIEV6Wewi+ZApuPBmFN0gwPmvnF9R5nrOZ0Ug3cIOtC8LJww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903662; c=relaxed/simple;
	bh=fTPIV+oI3kYh0LEXnonxVmZ78pGC/tfuXM2+uajj7eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cb/zd+QKLuC/ObNzhg0cIxoCFKSrQSslHMTe+JyyszRZBCPyaX4QNTK8mboHvWFfnMSCCalf6beBAWrvgMe8mgaLtUWL9Pv4e+PnB/3cY+YXK6R/rRkGEAL765O0qKz7Umi6ZvhI+CAMglfwKi2PcO53BoOZAqU2Kdxfa8zwiy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFK2ZDtO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drMLi6IT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFK2ZDtO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drMLi6IT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Rkcf2834032
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 07:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ax7ZDiTzszcIi/HuEDx2EHk3
	5sqUAKxKqotM2jS+F0Y=; b=UFK2ZDtOeglH1uvzuaaUpUFjLBT9cpMnLjnhlL5P
	8biTVhO5bYgNAMNoGQmNK47QdWIhJNeQmU3UvVyySOLmqjarHsqXMheYj0pQtYMl
	WvpF9glwU1jIqX107xbupkhfCzp2VMdZS09z6Z+zWDe10nrpnBn05ssOI3OY0nQE
	ix+uzdm/XfBwV01jZiincVByVFlXuwMg/QG7c1kJ755ZaZ+qHn7UN+vAxmz6zZOT
	4u/Bse/J2HX6qBH/6pSHHLyGHUN3sKJW4Gmvb1Od8wwvc1i6l2602+4VL4+95eIx
	2/lSNUXzRS/AxYCr9MaoFdM3Vlc0cyqA7W7ONPqYHIExWA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4xtbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 07:27:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfd2a26ab0so1626688137.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 00:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780903659; x=1781508459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ax7ZDiTzszcIi/HuEDx2EHk35sqUAKxKqotM2jS+F0Y=;
        b=drMLi6ITtd66u71HnMv5ojEJfcWCkCZIehuwvet2UHd6V4Qa6jb/ZqVQstMq8nVm24
         7bCkojHSEy/GR50W2UDBsnHY/lPXR6+uP1n0H2ajIvf87vpk+yZ0Y/zcTiHL8xLP4Fj3
         gYtq0gLOeW5nNHSx0nxDQq/RmjG7qURw3WCOHMmqNFsGQmJEsDXCwJSgONAYUAREAeJX
         hOcs89IOQSIjLzmHDvMZXGyZE//sqdWDzwced7mIWiYM8ppOKF4kl4K7SPPCQKMYhXLl
         57ua0bZs8FbGGu0zlkBqVFKfwbSq9KIfG/ntkRceqVWb+rw9pAqgmPdgd1YeS2yrlJjj
         Px9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903659; x=1781508459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ax7ZDiTzszcIi/HuEDx2EHk35sqUAKxKqotM2jS+F0Y=;
        b=G5qk4aHgRVScUhmC6r67sIh8qv1WGDC1qsAkSXhXjg7B/znSvOpz4Xth3X70Eo8Ew5
         L7yx1otO4xXp3G+gf2Ge+Z/yEa+tADc5MKFSGfeVDKDXuQL0CjeQhvbNPdFDt75l9HhL
         WvyPBwPDD9Wppx5nXB0GRr3MhnvnVXXWKJJwN2hjfJqtbeAMkDX989eTf/JUt5Bk2/I+
         Jw7OpXP5vsZZu5HmIpj/DQjOsV7tyWw/aQXA0YYtP8gQyimok46/+BHGd+1o94MtLqZX
         yuo2KGNFriu8dk9ZPLWaFr4ZfhQzoFNrOuq/rxXfp6BMOpEtHNpPv1yMZAT7D9QzFm4J
         4m4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9FgOsmzQmSCkk3ru4Zid+0gLT5w42IPMPhbTfy2YA7631pZnqdrtfT8jr3BogWoDPlkhjqQhvsv50=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7cSPGa45uzIGUqvlXpylsVmuGoFNt5csbJ+JNaO8+wJeAenTf
	ZIcdTnQxnXj5vM4oxCMFnmirsa5fDOAFjPskd1mrjMQQlnPdl5qlOmWq1kv/PCKepko4ghygMDn
	GwAyF+V9JAbsS3Cc6dYpf3jlWm7OSNgfDF+v5Ge8PSQiZjItpxWEdyEVkAy8m0qg2Xm7eoW8=
X-Gm-Gg: Acq92OF0T48dEX0kdeLP4QEG7IKJqNcwmKFUHe7DO+myX0RU1nArbKUH15yCJvx0NF7
	5LaC7l4e449799Irswh3tT8qn6kw3UwY45XrrxZEt5zUNjFNnbTnaa+rkrEz/nDwK/fg3Eo5wHC
	BJ4uJLnub9CDLMNUs07jy5KKbCOj+diSrsM+z9COrwDecibah//Z2l30NgWg+uJLP7m9OBZY2oq
	20LkGpGCavsxEt9yG2rcXWysY3LJW0+DGrb82V0uMPIetr8GzDofJxa1+29V4qhsjoQUcxxqHT9
	wuCPeUJ2PjOTKEZuY6AYQfINdZYsMMVKxJBEHfSc25ZB1OLvOlYMOe+vwCXRT3z7kxF+56W1YPs
	ZrW4Yc2SFAw4+X1dMrsEA28hMQZRVcHjHi5ZXVKVnFi+hi91BNxg2ygsaoMjSJX6O0q2k21kInd
	mOF3M6Kr9aFdH7GCEnh8jnnPsQLFhI1RWjb3y2/bo9E2aUCA==
X-Received: by 2002:a05:6102:6890:b0:602:8c16:b24c with SMTP id ada2fe7eead31-6ff0238720dmr5736355137.19.1780903659218;
        Mon, 08 Jun 2026 00:27:39 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:602:8c16:b24c with SMTP id ada2fe7eead31-6ff0238720dmr5736352137.19.1780903658770;
        Mon, 08 Jun 2026 00:27:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9916b8sm3663201e87.71.2026.06.08.00.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:27:36 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:27:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8660: register CE2 H clock
Message-ID: <wkdussrqbfh46fr6ck3xlckrbblthko6h65ivyjwmiileimw7w@wkeut5rjl2hb>
References: <20260602042747.277270-1-github.com@herrie.org>
 <20260602042747.277270-2-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602042747.277270-2-github.com@herrie.org>
X-Proofpoint-ORIG-GUID: g_M9jbwMFNlLkT8eJoZQ-W-XdonnorTd
X-Proofpoint-GUID: g_M9jbwMFNlLkT8eJoZQ-W-XdonnorTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2NyBTYWx0ZWRfX0wXJ8xPNAY3X
 kLkTtFd+MAH5z1JPKUMCPNfdEJTlRsoASagKLOKkJCBmGCQbDeMi3w5EMAh7uTr/qZauztTrmVt
 rYP1U8qBQguWL1LiHSnlBFt66mxuz3ap+kLsifOwAELMacoQbncbw1dvO4kxo6q546F+RZEDQ82
 MBRUy96B516mjGsiv5gwvSq8canR/QWbPs78OmJkKQHsdRHKmb9lrOs0kzNzDdJ+lKdXkIUvVYe
 Pf7xMNPB1eowlocmqJvJKOncugbsfSuzYjIG0LKGQkZfpBQHdnIUc0GvI1CLHT8rMXj5iTHH1LF
 VL8j9I4X14ndiao0fmFkNAGvTjkeQdANA+8+zCAuGcx9htCswJADX2ezTydIjoKSSGa8yVBqQXG
 ugYmaNGtTUlZzO0ThL6M64CqzOiSBm9080PYXIpoIP86auoRPkVURti5P4PQH4LRh9QXwbkT331
 OfASbjVeIAjKNE0pORQ==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a266eeb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=cTwmTnRGAAAA:8
 a=EUspDBNiAAAA:8 a=LvhWEcBnrMCrogBIVCUA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080067

On Tue, Jun 02, 2026 at 06:27:44AM +0200, Herman van Hazendonk wrote:
> On MSM8x60 the Crypto Engine 2 (CE2) block at 0x18500000 is gated by
> a single hardware enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The
> existing dt-binding header already reserves CE2_H_CLK (ID 77) for
> this clock but the driver never registered an entry for it, so probe
> of any consumer that resolves the binding fails: the CE2 MMIO window
> reads back 0x0 and qce's DMA hangs indefinitely waiting for handshake
> signals that never arrive.
> 
> Add a single clk_branch under CE2_H_CLK pointing at the GCC enable.
> The upstream qce driver requests both "core" and "iface" via
> devm_clk_get_optional_enabled(); on MSM8x60 the vendor MSM8660
> clock-8x60.c maps both consumer-name lookups to the same hardware
> register, so the consumer device tree can reference the single
> CE2_H_CLK phandle twice under both clock-names. The framework returns
> the same struct clk for both clk_get() calls, per-consumer refcounting
> works correctly, and the underlying enable bit stays asserted while
> either consumer holds the clock prepared -- avoiding the refcount
> race two independent clk_branch structs would create against the
> same hardware bit.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/gcc-msm8660.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
