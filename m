Received: from mod.modforum.org (mod.modforum.org [192.254.136.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9933044366
	for <linux-clk@vger.kernel.org>; Tue,  3 Sep 2024 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.254.136.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725354960; cv=none; b=PUhf1FgyBBQql25FKOKpW3mE+vzzgv6c27hwdQZG/c3II31TTXcxDCrzowt5yYeja7Q5KFh5AmvP387/Vocb3X73njDnqeawnBM5L0HbLkUxcyKEotDV/ztK7C6lkJrrEdQi5hypykQ4yNpJwhwY69Xds/mAko2J8LWPa/WZBbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725354960; c=relaxed/simple;
	bh=G4BItOc8k/hB4suOfWWwTOg/U0FTlHwyCNnKCLPge2w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k3ZmA9TkupiJcAgqe2cUxK1gK7DVyTdSNPcTz7AZy96LH8/c9q1xnwMhb8ICan3RnEjfF6qC3OyX7Iay/4Md7autUnPF8HV42sfNShIV7fhgRBtZkGUaP1FrErTDH0XO/pC924l9YEaSnbJ+r6BN6OpwlDggPDOXz/evhrq/yv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basantfashion.com; spf=pass smtp.mailfrom=basantfashion.com; dkim=pass (2048-bit key) header.d=basantfashion.com header.i=@basantfashion.com header.b=ufHgv+Cy; arc=none smtp.client-ip=192.254.136.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basantfashion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basantfashion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=basantfashion.com header.i=@basantfashion.com header.b="ufHgv+Cy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=basantfashion.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G4BItOc8k/hB4suOfWWwTOg/U0FTlHwyCNnKCLPge2w=; b=ufHgv+CyIyNrVk0W4Z8I0d+GTh
	rFCygYXo5BRGojkxHGwOt97jhfm3y6ItJu0dxcm0DDI2oEooMRLnyGBsHzvWhdptAMjxwPX/RazQy
	nVvbPdRRutxtAVryrS6zmzxnkl17dUJzG6q2azUpR+4bOf+oLaWGP8NpXfDmXrhikIcqjl7bU2e67
	sAMAB5x1z9Vm9qcgqgKB/75+cGVbtuKmhOqhduW2KcXVIPTWZG4F6aMOBP4QrpbvxoHe7j8dg5+J6
	AJyYyCM3fnFAkChpfV3XwGe62ft/VEqoj+82KQavYvUqnGO8lq87QcnAY1jXEy53SdsBP0HeAmuFS
	9HzEbt0A==;
Received: from [162.244.210.121] (port=62954)
	by mod.modforum.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <kuljeet@basantfashion.com>)
	id 1slPcs-00088X-Pw
	for linux-clk@vger.kernel.org; Tue, 03 Sep 2024 04:15:02 -0500
Reply-To: procurement@mercuira.com
From: MERCURIA  <kuljeet@basantfashion.com>
To: linux-clk@vger.kernel.org
Subject: Request for Quote and Meeting Availability
Date: 3 Sep 2024 02:15:57 -0700
Message-ID: <20240903021557.B141638891CC0075@basantfashion.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - mod.modforum.org
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - basantfashion.com
X-Get-Message-Sender-Via: mod.modforum.org: authenticated_id: kuljeet@basantfashion.com
X-Authenticated-Sender: mod.modforum.org: kuljeet@basantfashion.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Greetings,

I hope you are doing great.

We have reviewed your products on your website, and several items=20
have caught our interest. We would like to request a quote the=20
following

Can you ship to the United States?

What are your best prices?

What support do you provide?

We are also interested in your services for this project.

Could you let us know your availability for a virtual meeting on=20
Zoom to discuss this project further?

Please advise us on these matters so that we can prepare a=20
meeting notice for our company executives to effectively engage=20
with you.

Thank you for your attention to this inquiry. We look forward to=20
your prompt response.

Best regards,

Nina Petrova
Procurement Manager
Email: procurement@mercuira.com
12 Marina View, Asia Square Tower 2, #26-01, Singapore, 018961
Phone: +65 641 1080
