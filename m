Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AAB191F94
	for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2026 00:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124244; cv=none; b=pTg51ZzrBmuOsVeH8DNALsKgIXHjTD44OEUBGvXGgKMU9rXl1ZByzbnZZI5faq9wP6oBO/tinw6lkmwOLCZX6XUGCJtpCfVa8R/ILo3n4SbVuXaPPtEpz8QYIbb0iFj9tkIKs26Hz149a/lBdXkvXFFJqf/C90EbIkjHK5c1Cnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124244; c=relaxed/simple;
	bh=9C5RJUSt8UVdMbRPJGWBOVXu5hZdn4wcQY2xt5fYMVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awviuneKltzZR8EKRKfMRz+iMsIH5A1Bo6TnW4b/pvPrjs/GUtmQrk0v5YCOeRojQ6h+owGTnevPfKeIPWNmaPU0vxGti+Ty8ZZMhyLBI8smscDK0EXbh5Kl3ppKnVSIZCC6YHidBNZSBKR9LDDqj9VsFW0AINtxbB1fTOoofaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zpd1yJu/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCypjqai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zpd1yJu/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCypjqai"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPZLq1019664
	for <linux-clk@vger.kernel.org>; Sat, 4 Jul 2026 00:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H1z754F1g7bGdP8+fIZCnGTO
	6+ITPOdx9vaa+Dfdatw=; b=Zpd1yJu/ZFq5Y53hjKfLmS55cLjQV6esll05S78T
	wZJ9VBczYGJoN6uCovB5MIl2bLlgBId+pU4azWepZ+5fX28azaBY/RCsfbFpTVuR
	sATEqhh9HR/cMMCWwiebJnPsPBwa6NknX6ks5sDPAlJLnitLQxaSZo/YngVIM0NH
	TrAIzwcGQhJ3lmugzWKUFNx9UZ7VXwJF6U+SUTk1m0uYoRJ/aQyEO6iN1kDujoRI
	DfJQ2OT8Zj84KT5maSVo3Zq5YE3oqPqmYNPbYbT/XB7PtGX8JSkgE4O/TvntkvQ+
	8BN3fjpb6mSzs9JnPRS89LT+tPOJ77YYSGAkYJLQrxhm5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj24hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2026 00:17:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so12417351cf.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 17:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124240; x=1783729040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1z754F1g7bGdP8+fIZCnGTO6+ITPOdx9vaa+Dfdatw=;
        b=bCypjqai3LEVeFW6OmxHaOXBtg0OyTpHiq+gdUkH2Vf1kQjDdqJpyV7nXHxJiRaVZX
         5xGtxElvXGfsx1Rc0sJL0wZgJuZ//m80am2FoCfCa81TzlguTXyOF9nQTwz/VBq6ivyP
         SIuZQ93dBy2Fy9DZr9LxSUIYJeqHC8TJXKZd8/kYGDc/DCTpcUodcgQV2bpVfB6nO5en
         9th7gHRM5ANyr6xNyXe3P74QLuNdFDnkcHz/OpGiwel6FpcHi3wyVjV5pIg+QJVe5JSN
         dlSDNX0Gzz1ATMVL9ThgNT4ZJVtVSXZa9IYibcHTXZZEbKWQewtjT7hbde/6vV47Raks
         u+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124240; x=1783729040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1z754F1g7bGdP8+fIZCnGTO6+ITPOdx9vaa+Dfdatw=;
        b=iRJDz0cwqRmbqKScjyryCgDY+HRjhoSr5k7Yx/3AT8SAWRhrRNuAjeZKeN8vXtZGPr
         Ow9sbM2JOW/nxp5zhtrAOcso2mVIe+EfjoaKbDlMGFNFAxtz1HzNmb9JcJoBklYdNaDd
         aJ5f67L4Dz9JSNYgMnYHblivot55dLqaFOvTE00XmjdmENXzcU0h3AK2UJbYftM+jf/3
         9WLaGEqGCdcYUry42AeUyuWgEDrKC6WWOq9qUqP2Cv6vNHuwcdLPDTOb1/ST/+aQLBLE
         DdYGWLJmxVNdAuU+Vn2WBF/SNHDx6B8614L5QORu7b0darDkkDPDIBwbDi/yoVBGjt1D
         mvRg==
X-Forwarded-Encrypted: i=1; AFNElJ9GP2+ph+f4M1/xQ2jqML51sPlyqW+0HRbsMJ2iytk/QdYrzvjmULbsYwE0qVjWgb5bqG0mrsKnbH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+H4mECTwxhECnN2B301VCvEVG151px0mFOLjO6AteDKA+1DhK
	Ef47Vf1wf8/T9sCcxJ1gE1mV+BJ+UJ6vDwGebV6Guy5v8MRzYEhDygkwfk6m2WghnJbu9jC0sNa
	YRNuNDWIc6MiAdiz8+YfXa9i5BOFx9FGLaSmtPSZTI5+7S2ikabqHwxIhkvwvuxQ=
X-Gm-Gg: AfdE7cm69x8TfxfJV5fZ/6O/8DwVDkb3DTt+ksbbquVWX0a7FGq6Ll0gYGWiGJt9mz8
	e0iAbQWezK89ydj0VK6xr3PBvYAux0BUgh6RflNtutIldH8iP2z3WNa8OKTrJo4+ncvVPXNO1ow
	suZVMylWAJCdB9GWIqzgUhKOxqvcYdxWWsmXeKtJFJPS+4lPsq7LK85XWFhaaiWH39Z/M242+BT
	ELAuABPj9ONQCMnMTmwNF7hpj+ZuSDB/vWnBKRMIQtdpHglwhFU+Qc5bWCcXdhPDZy6F/zLN39Y
	LdiYcPxGZVZrwtx++M/5YyZPPmOW6NOSCIYkIqxwlvo1NBGNOzVk4+/lyTcOZijzzJcbHK0SHJO
	4xFasc37P2dv0zKmsbix+qiKP9Q1yQhxv8M8OUxyF9rQs15tUA74LHWqrVCIz7gtXkuLCOyo2Vr
	RhFs7Fx9n68IG9Dy4cIaqw3WQO
X-Received: by 2002:a05:622a:4c05:b0:51c:df0:1b34 with SMTP id d75a77b69052e-51c4c2c3da8mr25420841cf.33.1783124239803;
        Fri, 03 Jul 2026 17:17:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4c05:b0:51c:df0:1b34 with SMTP id d75a77b69052e-51c4c2c3da8mr25420201cf.33.1783124239238;
        Fri, 03 Jul 2026 17:17:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377052sm866292e87.21.2026.07.03.17.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:17:18 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:17:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/19] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
Message-ID: <2vcr3x46sx5d4aogdcw3k7bqwe7bf7i24d436eb6o6gdi3zwwj@3duglhhchfx2>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMCBTYWx0ZWRfX/dRSWpAofISP
 /cGt687I1pd9RWglRnA9seHCtyu2AKnRHHFv9wGCGopUPMVEWWy+phRwzj4T9E2Tx6ebzrEY1Fc
 hn8j8IvSpVwfrCajt/ItqHvpxkFENy4=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a485110 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=bvhocwI2OAlG0vE5sJUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 6kTJ0bW-84Z0uS2_FfZyqIFHN3Ikn5QH
X-Proofpoint-GUID: 6kTJ0bW-84Z0uS2_FfZyqIFHN3Ikn5QH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMCBTYWx0ZWRfX7KMEktFpk1W+
 Sl3v0AMuUI4q88bs0rZl8YDVplWrX9IQ1n66D07ioI+VV4qelheB9y6UhFW7OBjdz2HHyyXpcaA
 +KlC+M4UIIwmF69/wfuthWzjqKutyb/lfQNTfJ5pEFNshtz71jvHDtx4DGEtmd3AyXZIaKiVWmP
 aJ8hGDjMbdeoz0FysOeCqXyfl7wLhEFJegXm/e1HWupn7kjUmOUj332xD30/8FNmaRz6ZsMKEQ/
 UvTmrGnTywZL+lrmPQankD/Qbc8+8x21jhegXrNkKEtnruDHQao4pUYWQ5d7S7TQGc3dP1BUJrN
 2WSPVe/oiPZMnhDWYiCK0Ylpet/O9DCE1UIgsuzUseq+ps13gAbowrCTIh/Xj5XsyvRasw/lXfK
 1urVFoCYvCFfYgZRkW8yF9ygTPW/c1Bq7loBqwKpHi3U/aPNhIbxYQ6F9k0iv3IZMx88I+1j47U
 pFS/NmEXAbfjWzUIZQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040000

On Fri, Jul 03, 2026 at 12:01:29AM +0530, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the DT index based parent clock
> lookup to align with the latest convention.

Why? Missing the reason for a change.

> While updating the parent data,
> fix the MDSS MDP clock source parent to use gcc_disp_gpll0_div_clk_src
> instead of gcc_disp_gpll0_clk_src. This parent is currently unused by the
> frequency tables, but should be corrected to match the hardware clock plan.

This sounds like a fix. Please never mix the refactoring and meaningful
changes in the same patch. Also, I believe, Konrad suggested that the
change in invalid.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry
