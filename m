Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4B73C3424
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753683; cv=none; b=DR55XUfRkwhIUrJPkEXzoXf4Ro9++rBRC+6Ew5yQfpRsJDyGljzVHjO6K2B8dlfQHx6BY/QcpCqiIm5oiiXlyux9LjgHk3saItd42/i+M0p9dxWxcxia/n6LAwaroglSoSMnJkT8xRwvb689j8iOj23eCvAnDghktdbvzFRMvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753683; c=relaxed/simple;
	bh=gh8BbM58DVW2VWsSOgtzxUQewwTrlXaK9qYuFKljTUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vo5Sc1TMj5fEMglX0GDBsLT3UUIiOkcLaJJJj1aok7azxxns1q/SWtu5GWXGA8roteh1yubd/8AH7Qe/UTc57BtoTPhtR2wPElaiZSHGsPVB4d42rZnumWgG///iWTU5Xam1YDU/4TabSlF3YHRhG95f1GcggvrjxLnfNqetjXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpXDUN/F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QCU9468Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpXDUN/F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QCU9468Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HBlfqR1025588
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 13:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bs/XVdX+Syc7jzUumQHDiRpq
	IQFI3gKM0cJFcpCULnU=; b=PpXDUN/F2jU1KeKJC6GZTASfrUOw2/3s0q4Gc0kE
	Eldn0+ZPm2fhjFdRAHC+9qozbTXQX4xgKrNH5zmHBtpBPQPzsC1EpqEWFtsgM6yA
	wMPZzSm3mt/vWpvX9Sfrma15pL8vVslJmI94O1/wHksvmuseenEJt/AkKuwmQQke
	mYBOQdwAv7Nlm2ZRnqSRfoTGH8CTQY+gUOcfN15WccCQz3XYDQY6aJhCAsXGf5zU
	yNtgupRJyWA2+wU1pEFYR9tpqpESmPVpzKFsdyBaGiKxn1N/6KaWNpeXyekMAD1O
	FvWuncz4XePiQFdwslXlhstJ+UHZk8is31QYxsEC0zzLLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy6d6ga2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 13:21:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fc27cf7so446069285a.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773753680; x=1774358480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs/XVdX+Syc7jzUumQHDiRpqIQFI3gKM0cJFcpCULnU=;
        b=QCU9468YimGHxeLy4aOWpRennf3bezkzCAvACNw8Nj7fBp0p21XAYyzyB7ykyJ3xCO
         UvH7Tk4BQtop+4ezOe7KaOXCdiK+x41FD/9P9tWMppbD2u3NQ9PSfC8NkrEH+zsZFiV7
         6kVPXG29U76dMp2LWCoaVFFCV/eszOqjePNt/D09xQ9oNPXkcIQrm5zqk/Supx+W+8iB
         YRHYWO/61/ip53XSUG1GzdLjpH+8LQwSwD7HnCJFGSUEnKzHuhk3API06UPV08kfIhYy
         MRLHWvIOxYY2PgfiRmYp7VVrwPXFVQIZVfA9ANx9i7RGM4Qaix1hA0I433o5xFHuqgUM
         oyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773753680; x=1774358480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bs/XVdX+Syc7jzUumQHDiRpqIQFI3gKM0cJFcpCULnU=;
        b=bArumLp8prjvqCd/yavpUh0lsHqk0h4bzPTowmhA6hYfOkPiTqFI7NitaAm9L3qpsW
         K9n39Au5pw1jcqzhTd/Jg3zUDvsSoiJhFHjM5rXjhLn7DMl2hc5gs1YIOLPNr0ck8EtI
         nuX3st3NnoV+SgIiCn0ezNxf+pVSIkC4BZjZ70AhmrsVcgAXK3kTbsEW7vnVXCVSGCtJ
         1mxe2MU1JwF9xxWblkbcqNskalb55nXgQta+uhKbGThb4RtjGcT5n/A4WWYXUs0vTKiy
         8xi0W4n4ARCiD8K/UNhRxKlLw8AwnJlgL6jJ8Bv8pOku0NrYjuLiyodOhOjKfx/s2gue
         Nz/w==
X-Forwarded-Encrypted: i=1; AJvYcCVh/Rd8BbV0/P5KxGkEJd2PJfPyca4RyZCNd4tJM2yUZ77vTxJ//ESQKWa8dVX3FaAF+nc5l6kIZWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF8MMpMK17v7/loTyg3fs0HZ9j1hZmHxkUeuukfAxHYQgPn2qX
	rv4YeEzNd/4uuh8VHPWDaFoQ8o5H97t2NHX9pNadiXSW4bmGRF7DMj09O5uXhf1+1tbgjGk0MdK
	FeGEBMdRupUEDG8/DqZ6deukXlBJUqQuW/Slng+DCyYTqtldWUUaJ2uhNztF0pcY=
X-Gm-Gg: ATEYQzxNgPI25IiyKERD3DayZzNyzSF1+b6RTAyIzzkHPpztvAEoXPnRapndFskwooV
	wnPdkB6r5rcGvL7LgC3DdmQgva054BFV6J2Lo2cp3ivUJ8h9bycI5omzRG/sQ605NbMAGHa9PX1
	pTqc5ujsMBz2H5JrWLjilkV1yIVBaXXRIBcDqg5QJfiaHeuTQAuVYFNpIgWaz1BZfQgvI2SDj3m
	h5nqCkNOrCzG+4aDucPhWR1nNCXqfng7Zor21XpW0asvXUsM1FRqwrYwHcMVdzAfkc369lnj90b
	g7EMZdS7u9UdoOjvyIxfGWfQ1wL/v6IkAW9+SeC98vJDIjIhbzx2YCjYyY3pe8flYmOPrb7LjqU
	AEkcCOSBKwwR1qNfR6ufNX0eCM01ET69efg==
X-Received: by 2002:a05:620a:4041:b0:8cd:9033:172a with SMTP id af79cd13be357-8cdb5a06007mr2228955685a.3.1773753680288;
        Tue, 17 Mar 2026 06:21:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:8cd:9033:172a with SMTP id af79cd13be357-8cdb5a06007mr2228947785a.3.1773753679635;
        Tue, 17 Mar 2026 06:21:19 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea97e8esm69315175e9.5.2026.03.17.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:21:18 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:21:17 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <20260317-notorious-classic-sunfish-d016d5@houat>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-notorious-classic-sunfish-d016d5@houat>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExOCBTYWx0ZWRfX/1ScFw+brvMK
 9qdLHzz6AJBjf1xLzyHpZi1jUhF++I7xOVCAEpLIUCLcklQM/Y7Tvfmyv8Tcrq9O+WBbmQ67hd8
 9E5xsZGi6MS4+N9RGALsA8wfab/vf7VW3K3Fspa/aOuI4QNynH8cwmdvJ9FPlVv9JEjtbFBGmvt
 qUWxVdltnCjJ0dnibiulPBztGN1aWI+3Ca6eK3TwoWVmjF549GKFvy2tsoaDEgAhj+IfY1QkBRO
 SBEgIn6/TrG26ZwlxdrkBPnj7my7zCZqwiSE63veLH29Bkzat+k7DIS9B/Zs08yDrIrBUrDl+/H
 cdIhXV/mq1t94jz0NMP3CwRp20xvvthQtZJDWy4S4yfxtoY4tbFiK6PHRSgImoK/f1mmeGw+HGw
 lKYWDFCcQFxBjz4dX2XcAaqvKBag0njlCiktAfgpN7GYv3RrEXemsDSFlW64HhpAxPEpk1ay9N3
 qkc7f581QWfZBT0+SJg==
X-Proofpoint-GUID: wO3_KLHQRRDl1CcTV4Oqy35--RrF8nbU
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69b95551 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=vTr9H3xdAAAA:8 a=QYElVs5_t2f3djOyXOEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wO3_KLHQRRDl1CcTV4Oqy35--RrF8nbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170118

On 26-03-17 14:15:50, Maxime Ripard wrote:
> On Tue, Mar 17, 2026 at 02:14:25PM +0200, Abel Vesa wrote:
> > On 26-03-17 08:30:24, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > > > At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > > > discussion about how large number of systems need to boot with
> > > > clk_ignore_unused. Per the discussions at the conference, the existing
> > > > behavior in the clk core is broken, and there is a desire to completely
> > > > remove this functionality.
> > > 
> > > Broken how?
> > > 
> > > clk_ignore_unused is to a point where it's seriously cargo-culted and
> > > documented as a silver bullet, when in reality it's just a debug tool
> > > for broken drivers, and the driver must be fixed.
> > > 
> > > But nobody is actually fixing it.
> > > 
> > > See
> > > https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> > > for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> > > fedora wouldn't have to package anything, change anything, etc. But no,
> > > the problem is clk_ignore_unused.
> > 
> > Nope. Don't ever mark clocks as critical unless system crashes without
> > them.
> > 
> > Here is an example or why clocks cannot be marked as critical but need
> > to be kept by the clk_ignore_unused: display driver probes later.
> > If you mark it as critical you just made the clock stay enabled even
> > when display is off.
> > 
> > And this is just one example.
> 
> Then use CLK_IGNORE_UNUSED.

But there is no way of knowing in advance to which clocks should this
flag be applied. As I mentioned on this thread already, we will be
playing whack-a-mole with clocks for a long time before we get this
right.

The solution has been already discussed for a long time now and it is:
drop the clk_ignore_unused late_initcall entirely and then make a
generic sync_state callback that the clock providers can use (or they
could implement one themselves). This way, until sync_state is reached
for a specific clock provider driver, all unused clocks remain as is.
