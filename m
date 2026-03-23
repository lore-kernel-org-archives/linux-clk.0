Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD1B35AC2C
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 19:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293806; cv=none; b=AvlhQ9flpr4UyMmeqs9YuI5/VdKm7UIbSDQ+5wc5e4BTArEyygwxMc0NHAGALi3QAe37pHWjN4NT/QaQunHlHpJfVP8vStouzyWCQtoDUXCS/BB/oE+LG4zlK30dfxpvK7sKxdpJZKanMuUeNc26Ti7J2hdInP+BN86XM6l2rtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293806; c=relaxed/simple;
	bh=rEnqD8tg75fgffkRgdqYPwqJo2fSWEVNK0HDQHHUxbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGyr5XXKSUE2GW8s+jNQ8cH/8pDaFp5MjxJczwCVPli0T4KsBCY7bmrm476WsZszQwQZ+/u59GAI0uR53f6hoCXlt/vPFWds4Gk8dQYt52r7ajqK2f99LkzOjFBybtxRmkfvoJNcOLFq58tl+2FWhSXj3GPd0lQWSQr62JMHtws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqDukPL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lwxg6zoI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqDukPL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lwxg6zoI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXLP1761785
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 19:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F5S73yFqmXzwL38sugaiBUyN
	DkQbDbjUMiBLQeqW/iA=; b=IqDukPL3hh5OCjfomUVj+Yhgd2OmBpbep2CzCiHS
	lC69SMNkYQglemRT/M0GjQbtttfmONRAnEGdaB86d+ZJxvm94KEsu01EnicmAY1J
	lzohu3oXkBCI3MhslEvBTohORpvt1wT0uSRsRRK9NcnT6++Uj4rP+lYvm0GiNooa
	4LyXtpmgd7eQqf1X2Q4LVzmziH0+NbqGl31TyBe8o4hondhzDfeTIPbzIIhqoi/j
	hknITx6psuli2KloenBpILSw4AwVQzhkYGeCRjqQqgZ+O7Fzpix6SFDsy5SFX3YH
	IJoyq2NP/P4tPWqzRlDT5F3axQ0Y/Jw6GGaPNDBWXNm23w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f098nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 19:23:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so25047591cf.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 12:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293803; x=1774898603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F5S73yFqmXzwL38sugaiBUyNDkQbDbjUMiBLQeqW/iA=;
        b=Lwxg6zoIP9QgFbnO07N3bKQAnWr6FMvkgt8ybhfZ9daAaos/nf+dXzjnYHZQKOfQib
         vuPsx+/cajL36rjYHO0KFk4qvUfAlIREjJ7sOF1t1HPi7aSKBzzSkYEuRqe5/XCo144E
         zfKd1NyaHRzasO8zcALhxleV+hjHQCBxn4pjlQ9xX70fRIX4WyWr19X0RgwaIh4t8Gye
         bUswZiE+JGYwoD2cbC7j1GwXEJH/riMfKApr8POGhdYI4s2rZaUI4N4NOYOR32fyWJss
         QQiVsLE4CQVkFloGJ5IoAhLAnKh6q5iUW3Hz925I9vk4dyXk2h7GOEx3a84/1YX0XRDH
         MdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293803; x=1774898603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5S73yFqmXzwL38sugaiBUyNDkQbDbjUMiBLQeqW/iA=;
        b=dZxUWAM9QXcpDwkHqjmnbOd+sui7yTkoq6MP1g3kP469cIu9RnIMe90MnyHhfcCMIW
         KXhh7Dh0CjXiYHpEs4FOskcD0iqW4RTlDEzfo35C1WWDi4ZzTtqWl6CBz6VHkHclzmtZ
         +HppY0UqkFEc2zGnUl88HCNjhaTJgD9//9KPqxwV1ratdlIXasDDi4WLgrzuBrzRmplq
         Ah1wO2Jp3T0HZOFR7vdTfq30sethdiWMWGUSAYfsZ0JbBNX49XQSRgtOEKt4PCvqn4C4
         i5EskuuEr6hOymnzQgahGlrs0/NlaeptREUKxe9yz0YbyIk5oHDbYy5S3faw7tXmmlTp
         AMSA==
X-Forwarded-Encrypted: i=1; AJvYcCUfSQYR+HfXVN+IMvygqz0/iQqv1hwv0alD8+gBh79V1dvulCubY2naJm1/WO7OYaOHwSSjf6GKxis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp5rn1ltlcVdCg/ynAvv/KfHCHpkWv/bjejIIucFUF/EortjAa
	PECoWeQvxQMkLx/0sLliLJf6j9gKuaxM2frMFr2JSbaK6PLP5DJzq76MWJPvrCgA7dCsOc5R7Re
	+hPeYj8scKd+wCfB/kZ50YzMWhCz7BZV2Mk7VEP2aOJcCfRO/r+O2jjOHjUDFxUA=
X-Gm-Gg: ATEYQzxRaxpWzcpXOA60MfU0Pzzt0oNIFM11b0UbHuZdkjzki+U8sT4Pva8RsapgU5O
	d+1st347dQKJIZ6FPaMGppwWK2p9bSVXDbBf6rsZWkLOqQ23PD45hZx4IXFVc9e1YwIus3QCJ6+
	WtXj0PUfVR23aDWF3Rw0G1TFWUA0Ejqy9VUn+tAPqymFgRUfoALsMBHqvI+jY8ELCCSS/J8wymO
	yg7PNlUfpn9dbspIP2zueJXU9gieWlFFZFmGOUgdUVlbJr02s5e2YI/qW6REIlm91e6WrWht8BJ
	kIZRUYI584RsWaBVSYtHT7KIF2jt7o6qjsnT0pZl0PUYnl3L9Fas/xgfzp10s+2bOmmX9CsCnCS
	eZzUgSVFZPEI/eHTGVjLwnbZSXF4AftpTDoZ6s67vYCf11jhAvagonNmuT+/UmdArmhsGyAIet/
	oPAteRfoL/EsCmTJ80ix2tO0OdWbg0Id42PCs=
X-Received: by 2002:a05:622a:17c8:b0:50b:526c:541c with SMTP id d75a77b69052e-50b526c5796mr110924361cf.50.1774293803133;
        Mon, 23 Mar 2026 12:23:23 -0700 (PDT)
X-Received: by 2002:a05:622a:17c8:b0:50b:526c:541c with SMTP id d75a77b69052e-50b526c5796mr110924101cf.50.1774293802659;
        Mon, 23 Mar 2026 12:23:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9753c7dsm29473121fa.13.2026.03.23.12.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:23:21 -0700 (PDT)
Date: Mon, 23 Mar 2026 21:23:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
Message-ID: <vonorgmssumelw3nkgd335lzi3eekinlslqb24k5lqwzil3tyh@epcgwiiu3xqu>
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
 <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c1932b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8
 a=Pc8HEx6hQBhlrjk2STEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: aoqFJb3UuDScFJij8FiYmvbPSneFgUw4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MyBTYWx0ZWRfX7QDsx79LBkbO
 63V1pKsZLIFnieG9g9d2ApNCtMoNftQFGfNC1C2fVQ3yr/QYHC/AN9k0s9JEElJG+SvKCD+3o7u
 5unubXmfc1h1aExW2ZQI7e1wCR+B3+A0EXu4UucorulAeqkli5ycSRPsN8tNG7Q7Giv04J+yowg
 crXrJLv03bH4MSwjMKPV1X7nCJJvA6J8FRwcM//s7ikiTbC2h++Nqi1dUt20s06zpr7NHJIoqmR
 9fnEI8ErYCLzLgfAzyawwb2/G8iNIHkFjlrCh+h9bKNoPLT5rX+adWS3Ry/ukZ/2TUbWU0O04NS
 a6h8nLBix4zJoTI1oHPgY7XS2nxZJ8dbk7YcipyRBs2j2+6U8P43vA+2FK1ceiyeBnpnncqJrHn
 IUmZ8UAA+a13RvhgZE6+Vs+9AKDYZoe6B80HSwJhtATfa5o5xgVR0aQqxenb1jN7R90HO/gVjpk
 mXt4fv/X3PmN2/YM/QA==
X-Proofpoint-GUID: aoqFJb3UuDScFJij8FiYmvbPSneFgUw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230143

On Mon, Mar 23, 2026 at 01:54:29PM +0100, Konrad Dybcio wrote:
> On 3/21/26 10:50 AM, Pengyu Luo wrote:
> > Recently, when testing 10-bit dsi C-PHY panel, clks are different
> > from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
> > now (dsiclk_sel = 0)) And we failed to set dsiclk's children.
> > 
> > dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000
> > 
> > byteclk was set first to 108120000, so the vco rate was set to
> > 108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
> > 172992000 on mdss_pixel_clk_src later.
> > 
> > Since there was no matched ratio, we failed to set it. And dsiclk
> > divider ratio was set to 15:1 (wrong cached register value 0xf and
> > didn't update), we finally got 50455997, apparently wrong.
> > 
> >   dsi0vco_clk                1       1        0        756839941
> >      dsi0_pll_out_div_clk    1       1        0        756839941
> >         dsi0_pll_post_out_div_clk 0       0        0        216239983
> >         dsi0_pll_bit_clk     2       2        0        756839941
> >            dsi0_phy_pll_out_dsiclk 2       2        0        50455997
> >               disp_cc_mdss_pclk1_clk_src 1       1        0        50455997
> >            dsi0_pll_by_2_bit_clk 0       0        0        378419970
> >            dsi0_phy_pll_out_byteclk 2       2        0        108119991
> >               disp_cc_mdss_byte1_clk_src 2       2        0        108119991
> > 
> > Downstream clk_summary shows the mdss_pixel_clk_src support the
> > ratio(35:16)
> > 
> >  dsi0_phy_pll_out_dsiclk             2       2        0        378420000
> >      disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
> >  dsi0_phy_pll_out_byteclk            2       2        0        108120000
> >      disp_cc_mdss_byte1_clk_src       2       2        0        108120000
> > 
> > After checking downstream source, 15:4 also seems to be supported,
> > add them two.
> 
> I don't see that, not even in the newest releases.. Is there even a reason
> we have to list these divider pairs in the first place?

https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/f7aec4359448d25c8a8d21ad8e8733d61f6b69ab

We need those dividers to correctly program pclk RCG2 clocks.

-- 
With best wishes
Dmitry
