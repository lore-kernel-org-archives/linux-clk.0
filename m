Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742E135028C
	for <linux-clk@vger.kernel.org>; Mon,  5 Oct 2026 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182771; cv=none; b=pDawyeA6C0vqcl2PRNkSIKNPKJxKU7mP4/cNO1zWyZmOWq2ZtmeIc8PExuJ3zSFQuVEsXYSNdIJIhdi9zjKHZj8EhDqISvHiAHUxP1kIwmWiJYRuODGWcFWcsYuJJ/bvG26ttXLwn7DzbCD0exAIAGcTjyher7RhtuSAXKu83Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182771; c=relaxed/simple;
	bh=/EpE2JWFJw3TBNSsiKNRmUaSmt7qw0r6S7KqmpuMupg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWhHic+atREcW1vgfJ8AuZA0OLsqD0B0qFoXfTf1S/CANOKusGnjQugOkXoMYWtivNtusb6biqm6hbG7NvyhDk+SDZINaLy7E9CvIBWRrzfvj431VsOficHc2xS4jjBtNBvE+Mege6aGmEZ8wz9IUh6vOA5Zdv0v6qzHYWawM8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3N7CzEF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xjl5VEfG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3N7CzEF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xjl5VEfG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695122IG4063665
	for <linux-clk@vger.kernel.org>; Mon, 5 Oct 2026 06:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DS/Jxbw/RtxNEdrQWY8vtrOz
	o8Z7Ka23qMSrwVDSSqI=; b=U3N7CzEFhzDDIIYW1KLKfQ5bGngPiHxI5/sFXLLC
	ynIGVzja3h+mzH1Myoj5B5hiHN2u0GSdlO0OLgfj4l5FlVkRPgsmwvMmLdSwdzXk
	mgVTLhAfZdvQOc1kfLlqrYO4f3bCjO1H32p1HmD55yT4gSfWA4cuURKrufb/pzUN
	KARb58QwX/ecIvlxdH7AGX/yMKIpwmodiL48uhee1Qzy8Cyv0ZDQKT04wKAYkyNW
	qGkaoVWa7sg5axDTRCeYupXgGi7U9FrfrWPJrRPUPDG46HMU9xrpUU6fmATLXAkn
	rb6FaqcBCLo5V1TPso9MTjzv2Jw0YwE4nIhAkqFojh1ilg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn8qmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2026 06:46:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93be1861d2dso246061685a.3
        for <linux-clk@vger.kernel.org>; Sun, 04 Oct 2026 23:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182768; x=1791787568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DS/Jxbw/RtxNEdrQWY8vtrOzo8Z7Ka23qMSrwVDSSqI=;
        b=Xjl5VEfGViB+6S1G7a5KySmk9nBlLh5qVa6+ntKZrQEBP3zNDJ1/GB6lnOZxMmE98Z
         vj9nFAlSdDAUHCPVDTNM7Lgk0UTwKze7XqgrDizuM+4tC7fFXi0EiTLUhHlJb26cpE0q
         J0cvKuDyPPn6THv6BNMfoYAe69kE/kqUbPmY/WkYc33h0obNvFFrvOJVDFe783ky5Lkq
         4H4iV24UkbzLs4EODJJ4Hl/yyMB4A+w0gWLvO1ppbjSfHVYR4HB4xdWgUkrJUxbxmc1l
         6IrNxdp+ngSflz8+9IIIi2DipXXXcpJHAZOsVJMEdq5H4wGIcJw5Frj+kobKAZA8p0Xa
         1xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182768; x=1791787568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DS/Jxbw/RtxNEdrQWY8vtrOzo8Z7Ka23qMSrwVDSSqI=;
        b=HiEYyamSWd5bGZ+rpQfxOyV8Z6ibggvVS9hovf5SBZv9y4/0QrpE8blODajic8encN
         A+T9dX82GLO5/TNNCUTXIslvchDYBx4MYJd3Q5eDGIKBP6YbXqsFT2ZzJfFg/GafkRCI
         TpINKfeT4FV+ZOY91Sal2ino/yYlTHiLXsH+IS8OfV6wrk3vFPVymwugSWr31FT/rryS
         lB3ZZMcIpVfygY3/cPwtTzADtwF0h47x1QA5LckCd9JDXkW8ejS4oGoWEmrP61q8ihMV
         Yxgvalym7ucnV8VgEmdgBmQOZH6gsG68778Z71SMKD51zcvfo2H0hX/wGD2LDiXu8/Hm
         HiWw==
X-Forwarded-Encrypted: i=1; AKwUvBxSHyntEo4b2Ju7Dl4g7bJHWRKXtU9u4YyEiBFbOxmZx9tTZsSVCBG49fKvWPm2bGZpx9h2ozo1HIA=@vger.kernel.org
X-Gm-Message-State: AFuF++m/fcZHR4nN0lhWraTbXgWASEV8kAiXzGC91C0u0dQ8giYHxIPS
	5tbjtJ2HWEtcR5rGwLT/Ze3ONKAn67rAfqhfGmH19EVu5ydQewdT71P9nvnmRnlpBTZJdNOJ+Yy
	NrItp0EYLqoDbLnAh4U0u6R0OzHSp20sMRMOfV4hbrHH7NRgE8o6hVm133sFRkro=
X-Gm-Gg: AYBFou2+wpLgL9TYNQ6SLXa/Jf1emsTtB6YIW9MVpkdiaUOk6zR/xCVOhx6wEgiofmO
	ivMjNpRXPir1CImhWW90K97jiaEVdTzIADpCrzKXdtbahlvsekOL/WEUxqdJMgpy580/UzPSX8k
	2ydTucQbZTWWhGlA2UfiwMkEb0IMs1GMH/mAOXsGM+wDImifRLd4d6t5/akJW7J0Bn+/01ZOmYR
	80ma9DV3nprzionN5/r0D7DjWL8y52Kg39/4AXiR0U9klP1JaTb6g1NoIgJN4H7fqp1JA6NLh5m
	5ObTDNl1UvibrHez1f6YMLNTsQBqnkOduQAiae94pYHGd06wXpXHM+kuf4uj9qkb4wpNunlfmLn
	QBxt1ecfIjRXVJrxE/rPVvNg570bvSpdkzAwaiU716+OcadvZXL/wsiMtQs2+iktyn5xdviX9Ov
	RqMtTfTo2iuo+o
X-Received: by 2002:a05:620a:404e:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-93e510c3e52mr1330077985a.61.1791182767782;
        Sun, 04 Oct 2026 23:46:07 -0700 (PDT)
X-Received: by 2002:a05:620a:404e:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-93e510c3e52mr1330073785a.61.1791182767194;
        Sun, 04 Oct 2026 23:46:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c795adesm3039416e87.37.2026.10.04.23.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:46:05 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:46:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: mmcc-sdm660: enable the parents of the
 pixel clock sources
Message-ID: <bhsrueyydjwzpvawtil3d2jukefdmleltrj3aw56c4hqnrma2d@wfvc7tzmc7gn>
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
X-Proofpoint-ORIG-GUID: xCXaaWaG2HWhuXNZMb_w2DkoJ8ftD1dg
X-Proofpoint-GUID: xCXaaWaG2HWhuXNZMb_w2DkoJ8ftD1dg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX2+FcZwnqJbpO
 3We60W1BzNbyUKhPa4AdTdzTlPuyZnxGld9OfUe/5N3Wq5AEN3nkSGOJ3tI4D3tC87z0OcFMKzY
 t6JNQoEzHwfzjZeVEEySh/kL1LKnWdy7I1RLwDPVZ27wmJeOqnU+VpYuwvZlX4bVjQik5Ajr9NL
 aQV52mRyxPRXALbQXsq9ps+NThT1VNH0ZbY2OUZSeQJggd8XnF18uwPkLZnbPXJ/+sM/zKejmRt
 e+iOEa1lmb0fUEZlVRT0ES5Gyi8E3d5+tvoByG+X8KAQyxuUSQBdsDgZmJXgW1kHoIVnJZ6ZuDf
 K3lau7lEVJZ+vKIm2dEZ8C0pnl6Ec4pIhpOppfjCVeAMJYVPub6BTmYO0FScn6WZPdosQH5Ruiy
 gtzz4qWxLmWfLb8iYPZQ8z3TUjxBsx70slIgaQQV8xfS+OAWgQCxGG/5mDI57wS4EH98UKuuKfm
 DK1LLXvOJvF8zOeL7SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX7BPSIuYwpGaN
 t7p38XvtnekG0B73EXUo/0FeXyIReI24rOaJJSlMGpWM2ilP+bBWwcE3Zrzw1XbLyeW3Xexo3pB
 qlmnv3IP7/wEkC7ePPobn8zz0zqPEf4=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac347b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=9pdQQDx3cQu5pPcDlioA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

On Fri, Oct 02, 2026 at 01:46:24PM -0300, Fabricio Akio via B4 Relay wrote:
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
