Received: from mail.spsk4.lublin.pl (mail.spsk4.lublin.pl [94.230.25.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B97D5491E
	for <linux-clk@vger.kernel.org>; Sun, 28 Apr 2024 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.230.25.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297547; cv=none; b=YZEjhiG8JfLH5TdaGcNaLTQboH29ZF++t9MmfsOLRw3PkCOZxovMHRYkdxmz/6lTi5cT+iYJZUV1qRhwhxqS6t4AYgkQfpAH6yDKMfiUspUEuHM/qt14ZjvlsjlNvqtPZTPD/gMJjhjfR8rhPC83SXvNoeUjYSsjXtjmxbK9hRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297547; c=relaxed/simple;
	bh=kdFUwcKwpXeJQfn1sG2syWuXDYMlro8QXIMxwzzI8wI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VrvfYV1MxCICz62eqqNpqTl9pZes32qIt73hJc3FJvXRfmwPIXenRktPk8lokQ8ihrDnXsZWALdbqahZ3862u5DXPiZzzWb3R9qwoXr+20TegfCu4qWUVoHVnoxw2uZmrJIR6FR1Tjoenl9uvpzrSbvxn9d7Of5nK5z6/8K+Etg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=spsk4.lublin.pl; spf=pass smtp.mailfrom=spsk4.lublin.pl; dkim=pass (2048-bit key) header.d=spsk4.lublin.pl header.i=@spsk4.lublin.pl header.b=vldf9GWK; arc=none smtp.client-ip=94.230.25.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=spsk4.lublin.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spsk4.lublin.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spsk4.lublin.pl header.i=@spsk4.lublin.pl header.b="vldf9GWK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.spsk4.lublin.pl (Postfix) with ESMTP id 595A627DBD
	for <linux-clk@vger.kernel.org>; Sun, 28 Apr 2024 11:36:49 +0200 (CEST)
Received: from mail.spsk4.lublin.pl ([127.0.0.1])
 by localhost (zimbra-mta.spsk4.lublin.pl [127.0.0.1]) (amavis, port 10032)
 with ESMTP id xKnZpo-XezrX for <linux-clk@vger.kernel.org>;
 Sun, 28 Apr 2024 11:36:49 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.spsk4.lublin.pl (Postfix) with ESMTP id 35C6127DC8
	for <linux-clk@vger.kernel.org>; Sun, 28 Apr 2024 11:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.spsk4.lublin.pl 35C6127DC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spsk4.lublin.pl;
	s=0B6D5DC2-FF57-11EB-9505-2F96557CE46E; t=1714297009;
	bh=kdFUwcKwpXeJQfn1sG2syWuXDYMlro8QXIMxwzzI8wI=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=vldf9GWKhgspo19P2C3KhcqIdEMA6G/6eaCFpiH8dNWsMYzggn5UkDs75o9kMwgps
	 mfeEeTjKk8B7dcyhFNLCJTLPoXkyxzNklp4J8JTqauukpAogymbnqAiiYErdoFNDYZ
	 /tEQPlR3guKc5Pvv7aeywKoQkj8CY+CaQ54XWiq3utD0ulvk/YSiQJ4NP86h5edlQe
	 0z0SlLuqaJxx2ceKIM0waAhDDUr+OMMy5zBxQ5w1+l9RndDqzLe442HITbRng5r77n
	 bKUX32Uw2pcWevil1jhyn+m+1U80kA9twUBfv5bSMUug/oSGwbZ1GUMeSGQF1Bs7uu
	 7ppQCIW7jemkg==
X-Virus-Scanned: amavis at 
Received: from mail.spsk4.lublin.pl ([127.0.0.1])
 by localhost (zimbra-mta.spsk4.lublin.pl [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 4p1vs0SFtNFg for <linux-clk@vger.kernel.org>;
 Sun, 28 Apr 2024 11:36:49 +0200 (CEST)
Received: from spsk4.lublin.pl (unknown [5.253.206.184])
	by mail.spsk4.lublin.pl (Postfix) with ESMTPSA id 2DB9227DBD
	for <linux-clk@vger.kernel.org>; Sun, 28 Apr 2024 11:36:47 +0200 (CEST)
Reply-To: cheng@xinyisolar-sale.com
From: "Cheng Kin"<Marta.Orzel@spsk4.lublin.pl>
To: linux-clk@vger.kernel.org
Subject: Re: Representative
Date: 28 Apr 2024 19:35:00 +1000
Message-ID: <20240428193459.70852DE41D36A143@spsk4.lublin.pl>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello linux-clk,

I apologize for my cold outreach.

My company is interested in your service as a company=20
representative. I have also reviewed your profile and know your=20
eligibility to work with the company.

Have a great day ahead.

Best Regards,
Cheng Kin
Executive Director
Xinyi Solar Holding Co., Ltd
