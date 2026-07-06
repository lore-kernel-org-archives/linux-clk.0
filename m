Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6653BBFB6
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 18:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362134; cv=none; b=GOeqIxcnm6kEDoDPPxk0i+ZR/yg5dKcXDzSuZk/4Ho8xpwHmUz+pqfzYo9b9oOC2BkRPh4IpST2EK+7ZUytk3pHnMDrtKu1SpG/YhLUMYQ9toItJaSb327v1b0MqHEC2Lc5gGkmO7WncctRLD+un8zfV+BqPJS/HuMPZcnPR8is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362134; c=relaxed/simple;
	bh=G6i4vAHulGxwm6vIPl6snnmm+f+WXIOUfdXb/1OUcY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmmWly+DY5+rTMXB9LDtL4RfMHzh3e3eMnvgwhdEsisO57gzGnhcRutgGSG1e1RRP4tIPTPccJyR53JBCT7i0O09hUg/kfyw74VKdF8DZjAKc093IJ3MQmQTZl+WjqWrWxrZj34tP2om5lQPzsqC4CsbaiuMElGNXh7YjIBa5NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICNziEBh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbVmyIHo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICNziEBh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbVmyIHo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFCjg762342
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 18:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v+oE012GSbNPmRWX2SIsV0+R
	GluI//ijk3Ve8PNTH7A=; b=ICNziEBhOwA3ThKdqAlrIYdxEyCtsuwQxSSe4066
	ghoWAku41y/5nokuhHf+oBQP/RpdRhK9lZZE/3sxGgXIw9LmaEnkyJTuY1jBcJ2S
	7VmAgRXMWxsEBAiJLi89Y3uXwkKh+c+LXabxO7jjUmp37skdEt0IR05a/1+2f+tT
	9NqScHRx77IWj03FrLHvBSe8YbOuQk5WzzHLQD4IrFGYPdcHzDcsGT2FxytZ+fZG
	vskpbEP2/yT6z+OmZt/beWQLRIMSlFcew3PRnKM60tMs3Pdgi8xmIox0820yQHlo
	B9NkXIubsaj2gfPpSc01mCbfRAnHJXR0w6DBjJOCrT55uw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxtyrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 18:22:12 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-966a617821aso1385288241.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783362131; x=1783966931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+oE012GSbNPmRWX2SIsV0+RGluI//ijk3Ve8PNTH7A=;
        b=bbVmyIHoZovVb9UyVbPdNf9xqYt00Jz7AD04PJ3NqWqWo1qvh35VGga60/HXHk3wsU
         6rFlfrO5UBjsl8kA5UJ+cIZ4awVyoCVlVj0VniPFfqxfWxCHUb4eUR7JkKzCMzXPdlza
         MGQuTnEwVjsBX6GTUY+KmPQNkE2usRq8yOPHT8nM4yS60fJMe7eH72f2QaDVbHxg+Oe+
         ux3VWZRnSg1ylfDzOhV+lz318KG24m3LavHkWB1m5rPm6rR4H3l3HGJk+6an7ZC+0Lo2
         Hw6fstm1hqbDWhr9Nl/c+6z2xBQelazAR65uo4P9ftr7g31V+uX55a7o5JOqyIuWGkrh
         7/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362131; x=1783966931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+oE012GSbNPmRWX2SIsV0+RGluI//ijk3Ve8PNTH7A=;
        b=nquc/4EvV0N2SMhzE+So+2EJqkmOzveJSi7yJoiqfG+jCsv+xbz8USbH9zikTCOWaj
         3lT32EWQDsRpECqNR4ZmxpQRZZYUXnpRyUObnt80RzS8lE460t+7RACjU6Us8k//oZpM
         rya+TISQQ0MDJqzjEX5ujNQgLnEV3feZCQBVPcdOl9AtYI5zUTr/i8jgREN1rvW4y0t7
         G3RiJF/RO1U2KNLfJdnrvPvKj+RZEBZelHnoULQuIDawCUuO/9QW2MwI8T+LnHvcrfge
         byfvAq5eGXY9/9t6wU5YZeOmMBMcUD6KDrjfgvP8/xHExALPBpbnSeLhO4DkYlnIsHN0
         0OYA==
X-Forwarded-Encrypted: i=1; AHgh+RqeN+a3Il19lYrqEw0523lbQOrt3uBxAWfVbGQPdtB3DV8rXDwVBhwIAFhrBg01Grjw+zdyAquJqcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRuRdaWyZCRyvK5WLiMsjJsLfevcqJVeUlAW8SruRtFPSIZfZu
	5hOqQzE5XXE3PyN8XUYy4Wi3pONFSum4uRIFK+OFB8MK6kPvPfVyTS9+CWSwnA/mdw7Tlpaky5j
	Nb1KXh8mBTjozaGya+ha+p2K/hSFw+1k7a0YV/o+Q9BoBz9vLsV4SBn4K8/Sbx3jy+ctdBc8=
X-Gm-Gg: AfdE7cnenCOc22xSkl9IVg1RiVblve3xdWKfwIvLSoNne70pAJwo/WXZ8Nyu0L33giN
	d98ipxx7m2t+xOUCfEhFwMx2IJPg/628vwzKUaPNU1p9uyeWzMj7a6GvEUEyDpSsgRk2Va37Oh+
	/Yao7mwj0QTqm/GsqRZ2CxjjY0PX53EWv5607BVpYVI6Nasc8UFJgkfU5V1Pod6j8aX3pGfCos6
	vcyybxdnnXpfckTXO4uao1f3PoDdKzpqiq1LfXD5PgQ4d+xn1sckKhzcVqgFee6QwFQ1wju0UFH
	DbFr9i3Wy6evhJafRD7WXx1GqCjqJquyROpWa7jsNXESN602t9PqplqSQSdleXr/nGkVSZ0TWTj
	q55ShwSs3a0xGnfawwr2y4Ma350p0GnZ1h6pp90f+IbengZgCiq0EJlpdzlxIetN3v9W+B5uRX6
	vZ+tfUEVd1mtLX9WVd+0ZfbtkT
X-Received: by 2002:a05:6122:4d07:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5be89537d9emr895702e0c.0.1783362131238;
        Mon, 06 Jul 2026 11:22:11 -0700 (PDT)
X-Received: by 2002:a05:6122:4d07:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5be89537d9emr895694e0c.0.1783362130681;
        Mon, 06 Jul 2026 11:22:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8b0sm3065981e87.4.2026.07.06.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:22:08 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:22:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
Message-ID: <wgaujvwp45q4gfm76py2xbxobz5zc4hotnfxwldeysn7go6t6r@ufcuw7khhadg>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
X-Proofpoint-ORIG-GUID: DOCX8E7TPXPm5wlkKRnhm8I40IfpKtlW
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bf254 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Rl_UxCnVGJdxiaxNqnMA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfXw1ZpV1tA4TWR
 kV1/QbVkpZr8vUMASkGW2pKDSLFpxHkY0gy2mK80cjV1oe5nx9J4vQj0RGze+u6Jl0fpDaYi1S1
 Z09BuUx219Qf+5+dITCQf7w3N4/q6jA=
X-Proofpoint-GUID: DOCX8E7TPXPm5wlkKRnhm8I40IfpKtlW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfXyF1qqqP9ZeYG
 RdV+rCJTK5+tfU4hFNHtpJP1+dI2KQZlMktPPYTCUBBip4Jw+zbF0tBiDjCDi2zsLJ/BwXWOm+e
 WQ8Sy33eYeqKY5JQexhNuif+IFKKfb+YFqppXOQDkYGQx6nB25VYsuYgPV86SS6REuVjC3zlGbr
 3rF/x4Yc7vAOpg3/zPqXZAT8PBFIepk9C/OTQSw4klqKf/TRr/uAaFCBLvxBhn1MkpAXcDMxaCg
 OD9vmRd3EOECUEKYP/zZ7dXH6BnpsUEpuMCrhrejdtmVNHECw1IeaxKi1ACmdgTZRrR2pieJeRV
 aJ2wItWxajgZCFqNNMQetbzm4JOP2CjgPh5JkLiLE91iL2QkkEMe/hjckQy6awjMDjMNyzurlEM
 kXaCQDqLYT/sBUOhRmZJZqKq+RYxGlsvJLMEYosE3sezsP0qcoAYSR8BYZLV7qKQkx6RHRTp9e6
 jjxv8MM7zl4pVKewUOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060185

On Mon, Jun 22, 2026 at 08:54:22PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Both of these changes allow the framebuffer to show upon boot and let
> the mdss driver take over afterwards.
> Before, none of these actions were possible. Only mdss takeover was
> possible, but screen had to be turned off first.
> 
> OLE configuration may have been a misinterpretation... that's not
> something that's done on the downstream driver.

As far as I can see, SM8475 uses lucid_ole for PLL0 / PLL1.
So, no, this part is correct.

> 
> Changing disp_cc_mdss_mdp_clk_src from clk_rcg2_shared_ops to
> clk_rcg2_shared_no_init_park_ops fixes this warning as well:
> 

-- 
With best wishes
Dmitry
