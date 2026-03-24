Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742953C6603
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 22:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391374; cv=none; b=ppi5izkagJfCN3SSo2GPQp8sPj3FB+DSCjZHbVv3+EJTWBBJfRENGfA2/0y6c3fwsvgqjAX7CVXkjNsRTr2v1gQjTlnAkg9XhpjyaFUWk+KDaDaXmPLd4zNfXDtoLldbaHLZEBBDka/LdRkQyOx3py6jDvtTkyf3gycns7TyCis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391374; c=relaxed/simple;
	bh=SepiFRNI5rVtwrBIUvJ+O7VJ/R+/s945d+Zg31iJ1W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNUcN+koxQAq9WRh4AjrGalJ9ARbGHYMIuzN+IZjgUPkMrZL17Tw6mDDLh68bVI/RrA3qFmnw8EZah5GlzZycgcTVAYNIHT55d5oHmfDtI0mqGr/l7HTA0J0+h8r3RKbEBgAWdfdKnqy5+Tkba8aytwAERGoeJZR/mK1F/s+QpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XO1Di+b8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B8NEMOku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XO1Di+b8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B8NEMOku"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJDmZs3984634
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 22:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=crErFMmMQQYPDyY6gE4eEkzC
	E2pUe0v09b/TKB9REzc=; b=XO1Di+b8pUosSEGwLNYfcQtSZwo8WXU2V48D+ITW
	m3IRNd+VPdQN8ZZhN0wQ7GGxn6q8/7e3jURiQxxjooyzCb1RMpbYeTJh0l1wDrDI
	rkQaVIPN4C6vSNE5iM2RqUVii9Tm9Jp8kLAgjjSftdB1YwmzS+u+x7anrqEuID0x
	jicysT9sbpwcSeOytWSGsvWAP+LQikz1SFSkQ4cosr7RZ5MtgOiUdJoCo9rZdOjW
	KqD2RfHccT+vbup30hVzfI6oKYOQcA/ZSwDA+SP9oYReKxQw6O0UcIS8x+v5Owxt
	bpMI+sfcW2zHwqsJ2VMstZrV/kMZNnadEYvwnB9tMAtReA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p8338xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 22:29:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091327215dso303114241cf.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 15:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391371; x=1774996171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=crErFMmMQQYPDyY6gE4eEkzCE2pUe0v09b/TKB9REzc=;
        b=B8NEMOkugFMEdvxF3Rn5tLpdMYFvQ8TyqW1veunkyYdmQRHCFWk86EKNaSnM/87R3X
         TNNsIi0Hv4c0UAbrBlUnmyWJU5B09iBiGK9fwuZFoSpt0ca30kDNxQ595I95P4H/nCGs
         Edb6xyeBSbSPV8rthz7Brc8HcT1ewz+TbmahiS/RJCNtlw+Z94/uKrKNSU9N6YfxfT+w
         zdrM7z+bK9VMFG2qDrbxWAUHJVsG7RMKHyttIvVeKf+Utzr3OAJxUCawvSAaSTP19vQT
         7FS75VTwhYbxCdal1NXUbMng5pTv6Bww+x+JaTl5t1xNItQlldHfJ5lpRpLZh9+Fms5N
         KkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391371; x=1774996171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crErFMmMQQYPDyY6gE4eEkzCE2pUe0v09b/TKB9REzc=;
        b=Z2y/tj3hN7AZLs7g/YzVMWVlUZlI2fdYNEjScKCxyadc1zDdJARYz3XP99SSDTBn59
         2g+HVcUO8G3i1QToot4yp1395AfYt4TfM9TRs30obkEdMYKv19j2ZYDntmPuS5d/DoNt
         /DoU0jteiiMynhppDQJo1ogkYyrlxElVfhjgDOCD1MWTC2tHodCeVQl9zUBEHDa5oIFc
         HViNNfoYl6PZZp3qdYT4kXjTVLTn6FzCGIY23L35KMXPVoZp+oq3VvXUY/bNQSUkopFG
         mzXPRFWLrfIqZuJRY04zpDOGX19aaixPnooMyaStrMHggOeVTCIjV/3a2/CUwEitIzWE
         PZmw==
X-Forwarded-Encrypted: i=1; AJvYcCWLXoOA+sU1apQRZQA4UtIT1/4x+ciXl6pugz9KZxjvl8esf4sBVA1khN+YKp0tZNgAoY2rdW6Zf+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/aMuQyi0Gp3gk7H7UsI9+n9rBfU+7rgObbcBvWKx8FR5PRU5
	iS5ffaHxU1W4vmWrplOt0vtJOO+ZpUWOIhWJuuxLBFRhgRrFTnitqeaYqboP/V/7yf1kfi9IJ9z
	BwufSguqEonQTwzOU4N93XPsSXtFDYwxe+eU6ecKhCK7RWECl6kwWRZYBTENiC0E=
X-Gm-Gg: ATEYQzx2+NTIlGpqtjUFuvXQUrNsERm0LPuf+LQTCK46zzfA9Vvbs6QgwwhIU2x5b8J
	zrJwZ3TRFIYr0W4FsgLBHU4izAPpPhMriIav4WSJFOCsO61Xr/k7tEyZibToXrP7/Y1gNyiAejJ
	hE/HWq4YdDWm0MSh/RYZRCr9Jz3BgsNpY/ac/mjwtWM0IC52prYmC0CIyPt6KQGCQpzaWLDM641
	nFe6wdAtQv6EpS8x6v3+x/FzqY+5/nIPlO/zAVk6IdzU4rUQyVhVGWAWLKprboOn3iX4Nuf9/jo
	vhlUv4zjHo19oDG9q9EzA0yvyfF6+/PwBa0LuU5RANG654MGnIXVSbjWphdp80rZxvFuLtOqKyk
	skjjm328+tz9CjunL2DlLcKZ/sjMuOZP3MOpWdULDbtm/6k9/QNo1BKoqztjlDeuYMlDhDTytCe
	YrvLnY4vsdGUGLw+DjojkAEgUc5W8omdXrwl0=
X-Received: by 2002:ac8:5743:0:b0:50b:6a6c:ed06 with SMTP id d75a77b69052e-50b80e2e793mr21489571cf.49.1774391370738;
        Tue, 24 Mar 2026 15:29:30 -0700 (PDT)
X-Received: by 2002:ac8:5743:0:b0:50b:6a6c:ed06 with SMTP id d75a77b69052e-50b80e2e793mr21489191cf.49.1774391370313;
        Tue, 24 Mar 2026 15:29:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f24sm3544934e87.39.2026.03.24.15.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:29:28 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:29:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
Message-ID: <ejt2t7qlbiwctjlcbaqxw2abwa3lan2dewmubci3cczwxp25yp@ifakhv22rhgh>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
 <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
 <753c4438-6450-467f-916e-b8a3f1d3940d@oss.qualcomm.com>
 <a0b6030f-be42-4f5d-a59c-db78912ff0de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0b6030f-be42-4f5d-a59c-db78912ff0de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MyBTYWx0ZWRfX7ybsRgvNw0u+
 vYGa/TF/TALgsyFJ85uDVCc3DWcqHJj9N76EG7gOTd76dToJQOatUvHZiklfDyrOESya9yhtI1E
 DolAhKLreMNp7lezXYXHyGYKrvRcjlSBMxvpXZtYVJ64Cs3+YxcJKuNF/nsKUnGkEH6TMHUvJhR
 RHMnp3/9byCA4iBqevmUtATUFwJILNSU6tCYauIkTYEQU2j6FeVYGGzmcovSuekQjOM5JpZK8o7
 IzwtmeV9QU9ee1oTCLaoFdUi/kR0OBKcqtVD1tZ1jeOZAyANsERoYrvgJkIIAQV0uDK6yENjPd8
 S+Myy5J2W9GC/EnF9jlrLfyyaOiyxnaELu/+NqIyaqCNJYD4vsPgx9y0Qe94Dyppy5RbYWeiGXJ
 HAJQN6UORlzBXtz0b5f4f/QBPxAN7VWTUvCoVQHxD4dVuWP4F/3no247oe9SshimIcQMH0laKYK
 AwlBa0EzZbsGG8uW1UA==
X-Proofpoint-ORIG-GUID: uTSBPT-pZxOW5292PMdywAwjiICOm2Jy
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c3104b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=DiUhS0_jvD4aztRdCdEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: uTSBPT-pZxOW5292PMdywAwjiICOm2Jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240173

On Tue, Mar 24, 2026 at 05:28:48PM +0530, Nitin Rawat wrote:
> 
> 
> On 3/24/2026 2:44 PM, Konrad Dybcio wrote:
> > On 3/23/26 8:25 PM, Dmitry Baryshkov wrote:
> > > On Mon, Mar 23, 2026 at 08:57:12PM +0200, Abel Vesa wrote:
> > > > According to internal documentation, the UFS AXI PHY clock requires
> > > > FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
> > > > the UFS controller fails when operating in MCQ mode, which is already
> > > > enabled in the device tree.
> > > > 
> > > > The UFS PHY ICE core clock already has this bit set, so apply the same
> > > > configuration to the UFS PHY AXI clock.
> > > > 
> > > > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> > > > Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > ---
> > > >   drivers/clk/qcom/gcc-eliza.c | 3 ++-
> > > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > 
> > > Do we need to apply the same fix to any other platform?
> > 
> > Most of them, actually
> Only SM8850 is missing.

Could you please fix it too (in a new iteration or as a followup).

> SM8650 and SM8750 has the change.
> 
> Regards,
> NItin
> 
> 
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry
