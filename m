Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938638;
	b=aeCAAEk4gyuQutOUry8i0Oka+yXB3/b+Kd8tJu7Yo7XD0SYbO2xLRghE/d2VUBE/iRcU
	 dyMjpIQWQvk1wL/y5HsLTz/xfk/3zVYITAGYk+T9u3g0GnyHqo6BfjNZRR9RFKf8YeQOX
	 ZUwoONmKE320IcaUCot+TirP9xAyQtFP8YoSM7M6TzUcy+9QcTsvIRjm+XDY9AtfKhFdb
	 TgF/rBdlbkTRgg6JF2DjtyeREtKIuRhKvqy3i1MnVa4vYdeNBeTevAh+aO0nnH9zGz/eP
	 mi1N/2YT/P2gtVwEkOucQR8Mkz+NCtksjtXH69brQnCCusOwfLGVUhBP+QNCwLq3ISA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
	b=Mbyb3LSg9nUvpMXKDOcvn5cRvnXtZ6zzWcXofBWJQ076U/nzc8lEQZZtW9f7CyDRPZyX
	 0FyvlcJWazaMvZS+5/UXPhcDuM+uzdOoiOWsNG8lJxJb9qhtDOmPC0H/QOyVX3+P+p/fc
	 YqZMHHAmcp6u7rTLyQUUmL7AlrOH/jiYnmelHhFUShlW+EJL7dnyVstsc6ttNiua9bw0m
	 mKutC6n+C8TLt3w47J7mGZbZGB5gZqc3V6cVHf1CBLOdapezV41OrOUYE/ngPbXZ2uKew
	 aUNZparn2qoe5Ofa/yHztewNHKNJOG7x8M2sMV0Gy40VOOYbJ1eLWJw9/y8T6C+Hycg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YpD0FpDD;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DDF606A330
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 18:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19DDF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YpD0FpDD
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso2641705e9.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 10:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794938635; x=1795543435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
        b=YpD0FpDDwRYk0+tTDmxkLlPBd1kyejPedJ5+xOxM/EcL4d4r+LLb1C5UTFjzFDbyHn
         lc8CA8zc0kpx1QqrFK8MRm45z69yXPEqhaARuSnbcFGPXf3Nm01/FQG9hmhjRE0Tv44X
         zlRDlB916srIukvu4S0uA24/EJktwNQboQh2nKfSB/sV4NNph8SJ2NzpwcXQPWC0YJOM
         Jb5+XQj7vndiTD9RboYhHMRDqX3dUBW/3OK3h5jSoNG7549u7exgeuds6ElelV5mZlII
         E4IVOAL70g4E4TawfnDbnk4kKgLd18gvQzUpvMGuT/GT+QYhyeBFkrUg2TFRLOjx+4y8
         wCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938635; x=1795543435;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
        b=Xp+TXNZK0TfsBzRIlsbESmzA2aCDn6CEHjPz9gx1NU9tHoWaJbLn7C7dXwp0fLEpXT
         OsVSCx1NyoQD7lPm4AJC7ulrAuhL9B+MNbzY2AdVfpGhZjpl2euRfDbj8AzEIzWp4txm
         vhkheX9TLovMTHv6Cj2Kij7AkWNnfbn6X1FeQZogws4PsUuT8TtP24vNFJkz5kgvwxRa
         9/ios8NfQHG4OkJlEdOc/1iXNQjNe/Jlo9fikrnVAtfP2LZE2wRqssBXgIDeFmu2ScWH
         3q6Tk1vRvy7sKztRDj1FrLU4607r5mGIsIYRnN61Z9G4edsdzwcpuY2FxYxbXU90KpLj
         mnaA==
X-Forwarded-Encrypted: i=1; AL+hErHhmI04qQhRiXyE4YH/AtwP7+Zi4iZRwxaAodl3ZQWv/6SoQAhf+x+5+gL+FrPhDC5AN55btxUgQWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vPugi8UjjgdWpeOe9lbX8V6CJKme6Kq8BH3dHKIO27B32rS6K
	2IWLxoGILDQCrgvCDpyaWvlS+EGi2a/uquBnJ57I28sv7UgxMzeG/RAkLVmABU3h5l0=
X-Gm-Gg: AYBFou2fwgzHST5iX7uHS01ZBJbXwRs/fwCnde/CXlFUGu6iff+CgJh64f0hmC4IBai
	HwQ5BavouZc9r3JTUxbq2D1YcMfJpniq5vRlyO5dPMugD9ALluNua7Ps1xXBZN1F+MIb9quVfsq
	94f8JvkpU0fXhmvnHaGoz0TrgBSgBPBmchWNQQGaPU6ODucfK199yUt0OOyBUoFSGo7NQBsL+n9
	XkErQft9SDivM7EDOxhC2+FXIy4pn19PP++f80Qa+9pwnAf6xiEhdpqzQLOofCNiqWcX0PGAht8
	qRUxY7BbaLCVxYcsY6uQ8G/G62hOg/OYPM0OGWeV/Ls0YZalFnoFzlFLn9qXSy1MNE5OV8yfnNA
	cednO9kee8FaEZJQuuEUOdmiT/OTY2yoixJSJkovQjaykaMMqFnQLwHoRQURDfkPMuHQhraWh3U
	t3TYY9HBT1mfusSVVOveqz+CfPLBcw7C5KrEYLFuOz8K9I0+SdqUa1jzTDhH7WQ39jkzyoDcbY+
	McYlbm5IXr/Zytn5cczALJ0SY5yC/UPcU4lyzPNN5CuVue8vTTaUJMOB3X/mb+FhYFcsS6hjbkC
	YRv9oVpsxP7WmvFVt+sU+PFow9+FtGJUdT43COlrZjJ9qYsz
X-Received: by 2002:a05:600c:3547:b0:4ba:73f:ef5 with SMTP id 5b1f17b1804b1-4bb55aa4fa9mr306817705e9.34.1794938635593;
        Tue, 17 Nov 2026 10:03:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm81197935e9.14.2026.11.17.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:03:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] clk: tegra114: Add CSI pad clock gates
Date: Tue, 17 Nov 2026 19:03:45 +0100
Message-ID: <179493854888.412784.10630903001767923804.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk/linux.git (clk-next), thanks!

[1/3] dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
      https://git.kernel.org/clk/linux/c/61b67dfc9c24
[2/3] clk: tegra114: Add CSI pad clock gates
      https://git.kernel.org/clk/linux/c/ecb755d4fe97
[3/3] clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates
      https://git.kernel.org/clk/linux/c/4d55ffabc35d

Best regards,
--
Jerome
