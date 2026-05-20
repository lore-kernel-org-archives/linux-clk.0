Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30E63DCD9F
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 16:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294558; cv=none; b=QZzLxNA3+WjNWFhBUYC6jpoTo+es79thTaAUHs6D1p9oofHdVVBjqPl4QCNFDQMj69Nkbn1CeHCYJhwHFq1sGb3GIyx84WIeCZUxE/dI5UbOUM6V0n2VZTRihioElPAE5YWJBnShi/gNqD88cRG9xTyOfvMlMdL3clHm84VcPZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294558; c=relaxed/simple;
	bh=guKwrZEYvB5h2JRruAj/qRVD+1cfikuiDLMfNbEldiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xg/UXL0U1PP/iI8ytHCvSzlPNFAa6Yztj1/2lZIdY4E0SW6wKp6Y+p/OYeMet8D8RWJMEwLhU9x1M43PHGTtzkcvxm4RExofsdZwyNR0zm+9+qJBtzbWwI8MAfhCkhwkKWeNxU4s2VdReq37Qf7JNnt+XUR3qOFI7wAAVtfy2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8a9Qk1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEFfF2gB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8a9Qk1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEFfF2gB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCebkl317554
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 16:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bUSeSLkufQVYtp8EUHyZA6H3
	W15KD1f1Veui0HYJlds=; b=X8a9Qk1UgXPMXI+4yNaim+sV9mWAN1MGIsGOW0gB
	nOqUYN+coVA1beMx/Oz5randUXeF5OIE/Q1dYTLaCCJnvbry7RvJGJj1gbTo4pMQ
	s+VhLdXx/Y2fEmJ0L7MX2sW/XpMeG/slgziMF7n/U0u9WfTAWuoLRFw2kHdtl/3G
	A29KHT8+bu4NMtcE01+4g+6ep4GgpiIgtjUMe+9K4FSVyZk3U2On6ncoxwmWWF1z
	GTO2hMsYfpnf9rfR5GoPq2I9GSj35rSCx0Ozm22I7rVAhnanCUazY5MTrHJri0Da
	T/B0CRC+1Cel4zDBQ2wACLZuSQAFmsuulX7m2uMHB8ZNqg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qrya8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 16:29:15 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5752c4a82ebso4787780e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294555; x=1779899355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bUSeSLkufQVYtp8EUHyZA6H3W15KD1f1Veui0HYJlds=;
        b=FEFfF2gBF5h5qWa0j0dOsbhQHeCr9568IvvUQ5WlXLeLEXYJzRTf7/RwRqH0ahu4qT
         HVFvbhYXN8rHYPAsgEvw350KnfNdM71ISWo7RY3fRFTcM8v0SmRT5L8mKpaMeznyM7jo
         qFUU0wd8LLLb1XnumktgYWGvbKobgliTJyywtL4iWqEZxINWjSnVPjHxFYzpcplZs1P4
         EekszRN6CWJ3Nyie70vgcYh5myv3aE5zVEBndhgDGO0ZdbBXapganE8CKcgmGrrrnlcR
         YkbcKSjMuwJKsD6y0HNoCmXlavNJp+SR75r7BEV9gEuxOmDp6a0XOw5n3+6rpVMNjxkn
         r2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294555; x=1779899355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUSeSLkufQVYtp8EUHyZA6H3W15KD1f1Veui0HYJlds=;
        b=CaVd90LVTdatsn2vhviFzNLpxU086YSERUcv9fbsWhs/+Y8m2pVUZWrmxrljfwKhMC
         96eqaN/Sf383UUnk1zr4elFzCKvKzOpNlxshVFj2Kh+tRp7oW+rwtRmUO7lC+JYRYspk
         xqhQw+omush0UxHFMSaPIsfAEGHE9XKORBB/04JlUdE3OYMW4+IBkquxPpbcQ3lxaCrC
         nM/zc2NY8DNYsokWbQFEoxLBxQeCLCe9HXRvQkGBLpGCfTLiqK2MiIvpvQwqZMptwmSf
         2TLcAWmf0J117POi3Su5Tszl2aa8GsHVk+WjRkncdrpBZb2g3sXMDPz5fh1umuX/LAo3
         ugzg==
X-Forwarded-Encrypted: i=1; AFNElJ9+tefB5D95OJyjoRnq3Exh5KCIse4TWHm3fuYktGXmKcTGTCg03TWAyYu3NbdhziNscqwL6x8iDYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKrK0mGjrCKVvEl7mbhi3rbIp6WNKDuqmwh2lgTI3GPcdt/08b
	T3c3b2L+PhvOJ1W1skwJwS8l69jOyIhX0F0ljLKi/zcIdmn9NVK6i9Kg0Rv+wtwSF3EilM0fcNs
	FW1Em6jauRpQShDRiVQkQUjCKSkmYcAi/xJ+E0NqgZbG23cStGCLYlskGbdaEjN4=
X-Gm-Gg: Acq92OHXGqdqazBzSIEi85gK990EGlgAWFEOdg6yjHgZC2gew+XvCkZXQhzeZSM2Wgy
	sxoHMcgSwiGl7rlTk+tXF9NgN1AsxmpqkaVB/rSmgaY7qqAoAmpbsQvVRQ9dmHofYPICWi7mhHy
	Tb3gdIalrhdcHkSv2SbYklCdRYYFn6zHs/ZJYzn0evRwiAsdp1Ml+RnN/8JNZtHbX4ibEX04xtO
	/kDQVgxJctWBO/MYTHSqWQE5s0bGTFKdt29OenuPt7JrptMlSVybCZwd5SpgHPvr3OnbKztuW8M
	WBPVu/y/7OyX8uTQ7gILNHIv7bCkmiQAvYiFcNoPHs6nMhFR7d9veFspdkip4TIGhxClW+xvqdM
	s9bYs/WCl3oh+EZ0WZEv/Z6k1JuxTqp6fbkewO5ReGHLlupcwnxAiJU1MD7LKnQoOmzLEEWkLHE
	TwM5QovYfm01Gv3fae+GaxSwZFg0JfEZxlXNY=
X-Received: by 2002:a05:6122:d15:b0:575:24a9:78da with SMTP id 71dfb90a1353d-5760c013206mr14705701e0c.11.1779294555263;
        Wed, 20 May 2026 09:29:15 -0700 (PDT)
X-Received: by 2002:a05:6122:d15:b0:575:24a9:78da with SMTP id 71dfb90a1353d-5760c013206mr14705226e0c.11.1779294550062;
        Wed, 20 May 2026 09:29:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91a6a1906sm5061603e87.79.2026.05.20.09.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:29:09 -0700 (PDT)
Date: Wed, 20 May 2026 19:29:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <dv5rw3gkmy7evlv3bm5ryewy6ppojxgcklamqmc3x567isomtx@3oonu5gtzwq6>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
 <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
 <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
 <1c0bb8ff-eaca-4779-9b2f-4d564abd8670@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c0bb8ff-eaca-4779-9b2f-4d564abd8670@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2MCBTYWx0ZWRfXxwEuHQQquWlo
 kcgki9OlOwYKLbLh6BfjTFlIF1UCVjzU/LMWAzWKUuAWV2fmxDStpZRj9FxNqwX+QANJ3JDn8xA
 Yfs5eIGa6sfKohObKsaxuWYam5SLIZCImC/Aci/UcTU1u/JOCfWtNHlhSLSf59hDGSBxQDWU1+B
 iSMAGgSG5N9vO2CuG2xmQpjXZJXULDdavTzSOApASj++WxzR0aFkCITtR5GR5kDGUsYt/WtIJ7H
 IQeXEarxtL7e97AowGjuVGnfy/k+G6ywftzD3GUeILsIfN9h8E/hdC25uqTPrAmlu1Jfee4WhAe
 pl1MLpFfSKcD7LvhN7qi+oIp8P2kgB5Zey1EkRnbQ0Sra8xAWI7tQINwsXSWVCwCA5tMaaOYAcj
 JVB46A0p26Sr8jYO2k+Jsv71G6UBa9QxSXBCa1c4FNLJ6XryHNRc7XC7FuAF7hVCLaq2R51vS9C
 8/b22OT3RZ0qsr3I9ZQ==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0de15b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2jIkRjB_xXtrPJ-GUZgA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: JgRVdjrFhOEdmoiwP_upZdM-x0n-8reD
X-Proofpoint-ORIG-GUID: JgRVdjrFhOEdmoiwP_upZdM-x0n-8reD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200160

On Tue, May 19, 2026 at 09:34:09AM +0530, Imran Shaik wrote:
> 
> 
> On 13-05-2026 08:38 pm, Dmitry Baryshkov wrote:
> > On Wed, May 13, 2026 at 04:51:03PM +0200, Konrad Dybcio wrote:
> > > On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
> > > > On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> > > > > > Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> > > > > > 
> > > > > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > > > > ---
> > > > > >   drivers/clk/qcom/Kconfig         |  10 +
> > > > > >   drivers/clk/qcom/Makefile        |   1 +
> > > > > >   drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
> > > > > >   3 files changed, 576 insertions(+)
> > > > > > 
> > > > > 
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > 
> > > > After comparing the files...
> > > > 
> > > > Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
> > > > clock-indices, but I think it should be fine to use clock-names as a
> > > > one-off.
> > > 
> > > Or we can convert it to use indices, since those are stable for agatti
> > > too - the names would remain in the binding, just unused by the driver
> > 
> > Either is fine for me.
> > 
> 
> Hi,
> 
> In Agatti, apart from the clock-names difference, I see that the AHB/XO
> clocks are not handled as always-on via the probe and instead rely on pm_clk

There is no pm_clk handling in Agatti driver.

> style handling, whereas Shikra follows the newer pattern by marking required
> CBCRs as critical during probe. I think that attempting to modify this
> approach into Agatti may introduce unnecessary complexity.

Well, you can start by explaining what caused the difference and the
result of those differences.

> 
> And the Agatti DISPCC doesn't have the DT_DSI1 bindings exposed, and
> updating this might break the ABI with respect to bindings, and DT.

You can add Shikra-specific bindings. See how it's handled for other
dispcc drivers.

> Given these and considering that Agatti is already stable, keeping the
> Shikra as separate GPUCC/DISPCC drivers is better to avoid the risk of
> regressions and complexity.

I think you've provided arguments for merging two drivers. It would
allow us to modernize Agatti driver and also to make sure that both
platforms use the well-tested code pattern.

-- 
With best wishes
Dmitry
