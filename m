Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099754;
	b=hXcTARkA0Gbon7JUirZwYvZ0zkZ/iuXWPkVMQmG7aJWA69owZqK2LOgd/gkE5VvSMzDF
	 X+zhFyA5MEiBkxYPBtr8IMJ9vmPuqvF8kqEbWfHLlPjXGhWinERnBwMCLjqCptJacOPfW
	 KzKlqKKhCcT6ectARUiNhkxr4ZviHcbK39sp8BcpFzaxSP5tuWMBQt6EjGjnXPkQhF0zc
	 F3YoGUa36RspAqHRcQk+3dCDR9jUOOK54u3ZK+mmYJJ3J8/bIyvBCanHhs12RDr90fh2z
	 qHnINuMA0VURz5soRl3fErf/6x8Y2XHaHoN0CnC6rSowkcWuQ1oTNHfoK62CPMlDoWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099754;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=21c4+zgwVBT+1QWvCPKRC/FFd/nxiq2/og3mAEhgoUQ=;
	b=moXpz8WsTfR0s5c+z0Tvokas5hNH3PoYNb63/5vQ/qU/ap4g3pRiorHE6dgNhYKQ+t/L
	 6+Y8Ckqm4qJ/AqwdcMIqesuZYpuUh0gs4OgPq7E8UPr2urmPTU1jx3tfnTtfkFQVB18QG
	 MEzPSglNdJVEKNsfQTj9KJffM4zy32t4mok3QsYMtwLis3evXcfehbG+zqzft6x2lCMUy
	 Kh39zJsZACGpY6QSnCfXNF4IXMi0ysNz4tUD5t/SKKBvQFV5mcnu7X27EPkXgTF4Kt2GR
	 JhmlYuKzFMYG05NtjaFwYX7Y4K4SwwHGOpg3hnTAxm4LO+D4BMHXWTWkdcc7MKrTJRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBFdPLoL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9420606A337;
	Thu, 19 Nov 2026 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBFdPLoL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FFF1F000C4;
	Thu, 19 Nov 2026 14:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795099754;
	bh=21c4+zgwVBT+1QWvCPKRC/FFd/nxiq2/og3mAEhgoUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NBFdPLoL3zSFkmR3/SNpfivEx3SWdETE0tSzP5JjT7didubcMwfl+kS1NE653OGnk
	 bsc1qsLvVeVQIwl7UzHF7+LNlt3c6XhctPDnqcBnGvjBI4nxxKBIj0O/YqHIPpIum1
	 cfw2dGuK2s4whnPreFfq87Yq6oJGe1cmMNp+qy60ftNqpx2HM2PpQ9h8tSNB7MvLsr
	 1t89pH/SulEFHhFQO4F+IMjjApAjZgRCMtyeOxFfYXT/kvQbIBhQkx821+RK9qnSG7
	 ECLYihvY2y8gI9lUaZP/WMK6O1gRLqkARNfnpNUkvxl1aY+dvsIcZVXWrMkA5IWF/x
	 0dgZ3buB1w3Vg==
From: Brian Masney <masneyb@kernel.org>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <1795076089649-2-ff3d027f@mail.zgclab.edu.cn>
References: <1795076089649-2-ff3d027f@mail.zgclab.edu.cn>
Subject: Re: [PATCH] clk: max9485: Disable vdd on probe failure
Message-Id: <179509969945.279474.9150888941184932744.b4-ty@b4>
Date: Thu, 19 Nov 2026 09:48:19 -0500
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=286; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=8AWIotaLDnCZYTTD6i9PDnx6h/PbZidKAXLgE9CsCjs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+8yQKlYRemP3AOzXLrJFJ5MDESRW+oZzru6wij0T7h
 RbPq7nTUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQmnmf4pyf3kUPq1kuzlVee
 LD2slbrA8NvE/dybdjWfOyUgXa9xWJ3hf7rJix+VqnPuzdgRP+Ogf8nzxj+tn51zXORTtx0/u58
 xhwkA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 19 Nov 2026 16:14:49 +0800, Wang Haoran wrote:
> clk: max9485: Disable vdd on probe failure

Applied, thanks!

[1/1] clk: max9485: Disable vdd on probe failure
      https://git.kernel.org/clk/linux/c/b9b50795d5ba

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

