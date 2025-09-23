Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7AB13BC0C
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 00:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674078; cv=pass; b=rgt9XfopmgTbrPTHjwBSiKRveXNGpechxbYC3+APujYWmQ7WZcRo2FTSGZ3WjjGOFrqV+owdBj5IAcWVAcl/6Xbih37znUFM56WxrKjE+JwDXWhpiS3P1TSz1wZwF1lnez6RcSDES/AlfcRm4iCYxu32Ddiqo3OInL237NHHCU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674078; c=relaxed/simple;
	bh=jQ44IDzLyPw2d1EFkwvWbWu4iafhSula/9m2XiBeLS4=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=PL2WO1Tn0AR4Ky++O93SS11j4A5EVN/1hQw5+cCXuQYJqNAhdO1ju/IZSBLYzMyUx0idgqBkWVa3YaDZDdrPSccPFXJWw4T+c3W/2AjfqhhXb0P6VbkxP11LHVLYqxZu70gAOxVMvO1fgcndBIgzeQZe5SV83FVQVUnRTGQvS2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=ZeHIXT6n; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="ZeHIXT6n"
ARC-Seal: i=1; a=rsa-sha256; t=1758674076; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=C41MeYPNoa3bcYQtQYuYfDENAjYEldtKDkoEjQ1G21aWj11gRbCQ/FZDJMLA07htxQyNlVp7vpMCmnFBM01GaRdXzrQnzbVnUs++kmmKfWpH8Wlq9x9xm63RtuZxERE4qpCSm8fh1XdQoqzLRmrU8hJ8mLuF9Wsht+f3h06vb0o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674076; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=jQ44IDzLyPw2d1EFkwvWbWu4iafhSula/9m2XiBeLS4=; 
	b=q2QsDLHBmi2rVv7b6e+TEi0AuRn6qR42vpVA+o8HiKG3HisLGtcKxeZnQHa0CCbUS5PhXOQ21y3NPF6Ax2WA0DVFPP86ojGv57uR+bSMExGHTQ6kQW2jKhvjtCqC5s+DbvhSA6FjIDfogW71n73GNkkGX8IbHozi7vEEYo6O40w=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9a665140-98d8-11f0-9ce0-52540088df93_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671653002405.6449572298868;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=ZeHIXT6n0uecIoYcLlU1dMRPKWi/8DVRUdPSz2Lv4De3etDrErMdIPuLteuKG1XA8JZtoW+uqcyH9g1j3u63oVzbnTa1O3Dm5KjViUHuX9/VDyfaj1uI4mVWeYPbRpFp2FQgtMvFINhMRqZl2YBhKQbnVOhdRy0lnd6aMK6xVSA=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=jQ44IDzLyPw2d1EFkwvWbWu4iafhSula/9m2XiBeLS4=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:12 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-clk@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9a665140-98d8-11f0-9ce0-52540088df93.19978ffc454@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9a665140-98d8-11f0-9ce0-52540088df93.19978ffc454
X-JID: 2d6f.1aedd99b146bc1ac.s1.9a665140-98d8-11f0-9ce0-52540088df93.19978ffc454
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9a665140-98d8-11f0-9ce0-52540088df93.19978ffc454
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9a665140-98d8-11f0-9ce0-52540088df93.19978ffc454
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9a665140-98d8-11f0-9ce0-52540088df93.19978ffc454@zeptomail.com>
X-ZohoMailClient: External

To: linux-clk@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director
