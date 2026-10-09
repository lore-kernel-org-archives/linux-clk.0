Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA8E4F3EC1
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570346; cv=none; b=bFCHTQkCb94YI8+S8rIZgLYlwlC8mDxTgqLDId17B/ZX0QAZIbjvLqGtQGORIRKo/AJC68QcSdwzfsFlPvOJ4b4k1tbjH7TPGeaewF7HcjbDUTlbZ+RWwcin4cVztdy2/LzjTQkFBeVvsgGqcWH/Ztxg+5E2IDU1QkB7CFZWb9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570346; c=relaxed/simple;
	bh=ln4QIZ//mh5C4hnhYhsYe5sqE6mDzfRs2ggRgng9U3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVRhwQ79/FFJXsH+qTgPeZ2t8c14TGBsiq37lwsxsNpif3bL/mE7JXe4vptvaEtxVPXRt5uC8KvLF37VGD9ZBNn7XWQqatmJw6d23iZVOK24RXQ6A4AibbZsL/yF5nTqPZYwCIMpZhaGi9/FUSIJp3jk4go2XDb3g6kXD1XVCak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOVkywyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jc/9+/BU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOVkywyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jc/9+/BU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZW0v2470735
	for <linux-clk@vger.kernel.org>; Fri, 9 Oct 2026 18:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sDkr6ltCx+DZYHQehyoZITfk
	46nY9W5Y2x8VcJkdJB8=; b=fOVkywyE9tdecU7b/JksTgZkx7psqZk+k6CxOIAv
	mnK7Ig3OvcVrNUkgzffO8Ynas/mKsklMFhs5XkovZv1cDwfFVAbZwhlLvcrR7G74
	B7K9zjJZgRcV/P/fQiVqhtyWmNXbQXHmg4k9UpMsHLuOuc7IEadzgaP/eEPdNJat
	n0phHnGIEtlc4si1byn/uuWM+HDH5LLvoy146REVY2aexCWze9nJlsNevCtfCFMG
	SfGLGkNNwM+j+Xi1LIxPSqu3kdmK0UkDFHhAyflVWqAyHGstC2h7ozoiZFkMzt0o
	CSHGzh5jJDWGb7LY5cGZWK71cMTXlkWRzXEpCfDBblg+uA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8g694-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 18:25:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so1221871685a.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791570343; x=1792175143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sDkr6ltCx+DZYHQehyoZITfk46nY9W5Y2x8VcJkdJB8=;
        b=Jc/9+/BU5m3vgkoMyKUk8drHUHO1+IhOlHeVpnRuAu3oSqrpcIZNEJ3i8iHHzd5WMc
         lR2cpIGdCwQvR0Qe3y3GFDafS4v5LdUahINUfs185wTvRXvy25rnR/b7DzJ8tJenJqHc
         Wr759u3b1mrrcVAedmNoOevWqyq0APsbU8y/cosZ2v5CbmQZoPLF7BRaHPVxOPuihatc
         aG7iMrU//sxQg9t5fRRGK9yD5HNCJQXq48Kx+MP6S5hJFOP+ubz6VX0asklHg4FCvlL+
         pI9G/4H3IXjMKIwsXRymsEuSnH6HWBhzNe6427wCdBpZpUrqxqjGEeLcIVdkvajF+cOP
         j93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570343; x=1792175143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDkr6ltCx+DZYHQehyoZITfk46nY9W5Y2x8VcJkdJB8=;
        b=SdzUYqAlJLKbGX+pp6Td/HRv/+kQqm2Kjbn/8JoQfEcdz0E1dNfNiqSVeiDLo49hV8
         UuiIHLpn3fMs1KjL/yWLkvkmcsAPqe6igkgkjcQFqsDrTQU62psqSGHXibguRtfEYMoH
         4cTaB9ungcPXhXLPSin12ThylC0Wae+e4pRJdIm2hervaDSml3VXx5xf7+x1Sn5NP4LH
         VzQzduHF3RS3r/LgtjtlpnqYN4TIX07ubW0cM3A5j/RnRW53CLSsbOKpg/cVW6069MMN
         t2aM7btYkpy1r4BhG+DgrBawoiU6yz6azwNB98cNHgfsivdYAGW+Vqqu7y7pe2t5QhSr
         hX9A==
X-Forwarded-Encrypted: i=1; AKwUvBx2eAteJde1H/ZRCKIEQlLm4I2ExmELry7aCA202AEwZYBz6rfbmd7Q3OtT3Ggz2PfQU7nC75bBphE=@vger.kernel.org
X-Gm-Message-State: AFuF++mkEVEG6vkDlWqV4ypppSrdnxe5VJVPn+CSYmeGwdGdE6gpkcDK
	fyzdHK8IM/8FcBhYtzNYLNSEtVSOP4XgjWN+sD0wqlhveAcFtrmQttg6GuM0Id67fHLyXrIu1/x
	Yh0TiMEZBwZ6UchR1nzqOfM52QvyLz41BHO8vt3qNggeJvELeuIWHoSbyr7pOJq8=
X-Gm-Gg: AYBFou0dpl/38S/aOqikk0nJaXUNq87BE675W6083RdjMgoa/z8JzTGN6V0eGkuelu4
	yOtOSGNjE3A0GNacncRPygCxXHvFxp/yQ3Syh81nrcMvepFE/wmA7Ppm+zYDwSotmg9r1IRsdqb
	trAKCQVodzhK5EQx8eSbFjjX7LsfrfkhZBiLXg2hGpjGoe4ZCihHmWZ5V5SQqZIiQoAZUoYbukj
	I5VRO+eib8DZ+NZyUi9eEcC/MYjvEEzoBLkL4bbmzIwi8I20TncCU5mJV3Qkt/Ycou5rS43clNw
	6l3aY/zah9DK1c3ZdEnkKQa8siN+zKG+FEGl+b0sgdw9ea1TWGG3NZMImNgaM1viCGk1nNvNfji
	gSKIxu0RyDlsblYQ=
X-Received: by 2002:a05:620a:c50:b0:914:afc1:c66d with SMTP id af79cd13be357-93ebd0e4d5bmr480887685a.11.1791570343069;
        Fri, 09 Oct 2026 11:25:43 -0700 (PDT)
X-Received: by 2002:a05:620a:c50:b0:914:afc1:c66d with SMTP id af79cd13be357-93ebd0e4d5bmr480882185a.11.1791570342449;
        Fri, 09 Oct 2026 11:25:42 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9462ebcsm5684705f8f.8.2026.10.09.11.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:25:41 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:25:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: mmcc-sdm660: enable the parents of the
 pixel clock sources
Message-ID: <mchcoty2cfu5itegc4doqld7bjifci7tla6ug24xa3u46fv25x@2ntkhymu4lrq>
References: <20261002-sdm660-pclk0-parent-enable-v2-1-b07f6c33e96f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v2-1-b07f6c33e96f@gmail.com>
X-Authority-Analysis: v=2.4 cv=ONOyTiaB c=1 sm=1 tr=0 ts=6ac931a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VfiecASNGqWG-1cBUV4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: E5zvmqEki6xyn8LZLbKx_s2i4L7ul1lS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX+S5Ng9E12wHg
 juUNa00nIWTTQPJlfoYEM1V5eaKToPIqBkZ34qDZb6ZzE1s3JFx3CIeMVxWGgWnTczIlUzlfk7Q
 eQbpEDJ4bhXq/+/Lf8eHoVIBPQqnZm4=
X-Proofpoint-ORIG-GUID: E5zvmqEki6xyn8LZLbKx_s2i4L7ul1lS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfXwNkWqObv4CGd
 5LEHjIc8mrqnlldXIA2lGqMN9KkKf7V+8XdzkXwV/f5Z15cyAGp04+9AU3qMd2cCDfcgVsNotyV
 ATb12PKzME5VL74SAIHXdegeK7a6u/olWfDCc/dorUlIEe2q6cIVmC3t+nBMeVMeJtaedityZns
 CHCjrUhFbh93uIR3ck1EgnRBhNsNfoUasgHP5rdGw3qeNGz4JAm/Oxk1bs6U848mrit57kzmW4c
 lVrgpJHbEKO5aGqQv/10jJK+w/7wkClXgyJ+wFnZTg5sPJXcTUiWe0SpgV8oSaTuDBF428tFKZm
 jwWznAr6slvbcD4PQHCwsjKaKh3aOOp4lIHmPr0UHs8BIw1gr/ineBE/RA69YcpntqaDHuqFw7L
 eniWB/JBuXqDGkBgqgpG4htxqHuxipRdNPFNof8BGzJe7IBXFCksDRA+QlZq41a2WBZrtZG0ztz
 3mCIhcXM13fFEF2OyvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090073

On 26-10-02 13:46:24, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> pclk0_clk_src and pclk1_clk_src are fed by the DSI PHY PLLs, which
> dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
> DSI host sets the link rates before it prepares the PLL, so the RCG is
> updated against a stopped source, and if it is enabled at that point
> the update times out:
> 
>   pclk0_clk_src: rcg didn't update its configuration.
> 
> Seen on a board whose simple-framebuffer node lists the pixel clock:
> the RCG then reads enabled at msm's first modeset.
> 
> Set CLK_OPS_PARENT_ENABLE on both so the core prepares the PLL around
> the rate change, as dispcc-sm8250 does for its pixel clock sources since
> commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
> clocks").
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
