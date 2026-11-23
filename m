Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406944;
	b=teWKYVlTVMTv2INZPpG46kb2vzxausSZW3kc5S5vIbmbeErc59vtwmgo6fAlzJ7/5XuR
	 9eFFDugPWol3kFqVsRizz04hInXg5w3W26UnL9Pnex0+/Hp6jcuZC5wug+t2K7wIixDP3
	 +NSnWPoJq+RGyhJKoMqldMF/PrUEAwR14kkGRKfMs823Y+Ip/vQzxEL/PU2fhrrGRID+y
	 42ZihWQNSBNkrDf1SDEKbboivaK7ETj/GCrizXxX84UBvq+XbOKrjmB5FwDMVHvwOHZiI
	 RCLDOr5E/JnBjKsd11eHg6f8sERtybQW9A/XtUH5Y61zVJYgtmIC9KykHkCYsGsqbxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406944;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TrG6k/EgDP09caUBgkCJeX8NDExo++XUhHt7v/HGC1o=;
	b=cC7EUuKru+fGSGWTi5a1UvBhlmoPrQYN0nvHcLY8zLpOg6f0Q121J61My+JL+jXO/gU2
	 lDkN4rjst+vGeEvQ7mcoexliQN/IWzs3LaXfEc0DoUU+FPvS+rkM/QDlITItv0k1iCPiu
	 YlGN3QFF7D4z1zczdJPRSTlHfPSHsEr+rS6J73DYYTAYJ3R0AouuobrmaGLddxr7dKzF6
	 EcQJeHyffzL627o8KC++oNGGoYmD8Z0W5Uwj9eL5+5oovRLVO0UVDpnqLAHF/cX+vunZ6
	 nPslD1ndOQ7P1BXErFiJgcjNpAp/gcSX4HgZkYp2yra0urVNiNVufAG0Ee5OWNGXXDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1034606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 04:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1034606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-92100b756b0so25682036d6.3
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 20:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406943; x=1796011743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrG6k/EgDP09caUBgkCJeX8NDExo++XUhHt7v/HGC1o=;
        b=BGAjAGNib1Wpozu300Dqb8LEEQU9lpXGqTDH0g2Ih++o+xw+gJxHis/p4ZjnpAzC56
         eTfzeKx5DcKPSSZHgXB5Tj9ZBZEKfdA5IiWLdGFil4qAGCtmBP63IJRakblQ2tuFurXt
         GEdHC5nIXWdjHdOuaXfmuU45+1sJUhE2XxEwNG4nU4pmTEG8kS9Sn7BTctDWAEUY/zuv
         f6UVZ0OrVuPE9OroOQ5JWbNTZoBDBJKmkUS/OFkhkNmRR55lhgw/f2HrHtF4GFFVpmSA
         CiHGpqj1OwbHTV75k0NtVIVOH41whmnriou4r680P3xEh6FmwTMJTxz36+6AC8TFpFzR
         zzdA==
X-Forwarded-Encrypted: i=1; AL+hErE8GECeBH144MrDabCptjej2tcZP1aRKyyoQ0ZHOO4WB3EHdRXRCsqlgft9MPArmQtsvItVC7Cshsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O+f6KYqwSSCMbDNqlRxmxTS8mSryItp5EAuBx1BDwX/DXjkJk
	DB/v6r4eM6CzxLsGV/ihuWvX0nPdHrP54C/hWGOhzYT14SOAtxCEWwrB
X-Gm-Gg: AZFdTZdBjAZiYtLwDixmGJxOoN34FMq6oYRASht869HNNWJXKxlfvroSZQiZJGKWIE4
	xTibUB8wXxhJqTBP3rVzNjc6Sm2leHEWCjVjje9s+kxW1rYjgXdEED8juN7zzmBlihE29W9iP7s
	HC9EEBSkPslnrfldK1uCEIMITaVE964eAAQmNcyQK4WDGi11owgQ6E/rSNXqDuKj5MFKq/4FZbR
	jrMvxI8k4Ca67OKSF2rBsVPE4dS7LW+wBKebRoa/R47H00OIYBzPWUVA5dOkuxsJgWCQkJS9p9N
	ziKqFz6gk+L/S8WjMP+hhUQhK1LEPYXT2E7Arb2W1cwLDQIV8J8v9j/Hi7a1ahHI+G0f/j8G63f
	T6QEJ5fJH01xoCt5jFZhbd4NNFfeaFLwYulD0HWKMc5j5jMKMbrC5a2NyehiRPVqyyVVmDKK12S
	VS78Y9R8OqFoJ0td0o6kgNY5SU6TokiQc22cHJlqWywcjsvHDxMPnlyTSM7gCgAk+LA1RINITNZ
	7BchuxIS2qWaYZHMLYJG4/JD+5PJXKLUQzQbZzJyFrQ37rvOappvE5WVJtgFyv6uJTk3m3he2bH
	/8HDAzCFkOnyE6EKtPmz/nyusmiydZLlF0Ea9EVIMVV83XgppybjX771BrrT5gwDgeb2gUi0DA8
	23TSR8emWqcLLZbCuQI9a2WuKgcL1u7PJ
X-Received: by 2002:ad4:5949:0:b0:91b:5d3b:4aca with SMTP id 6a1803df08f44-92134b4107cmr206786976d6.51.1795406942687;
        Sun, 22 Nov 2026 20:09:02 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm96203216d6.15.2026.11.22.20.09.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 20:09:02 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: sashiko-bot@kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] clk: siflower: Add SF19A2890 clock manager driver
Date: Sun, 22 Nov 2026 23:08:52 -0500
Message-ID: <20261123040852.50062-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <sashiko-outbox-228538@kernel.org>
References: <sashiko-outbox-228538@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Is MACH_SIFLOWER_MIPS defined in the tree?

It comes with the MIPS series, as the cover letter says.

> Can updating data->hws[] after the devm_clk_hw_register() loop leave
> downstream clocks orphaned?

Yes. v5 will register the probe-time clocks into their own table and
add it as a second provider on the node, the way clk-eyeq does. Lookups
take the first provider that returns a clock, newest first, and adding
the provider reparents the orphans. Nothing sets assigned-clocks on this
node, so the early provider will stay as it is.

Joseph
