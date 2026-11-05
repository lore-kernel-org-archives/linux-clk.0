Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904036;
	b=sAsM2xiFbRM9xNoAk1R8Okl1TDypVbVuntcYefbM5kK6M6Rg+JTIG0HlFAPz3lETXXvb
	 fh+3CQ+17eRfeWA9K/LLMlStj+GdT1IKbwHj/pQydCQ6Zu/UnBBc4sKw347yZ+o3MAt0k
	 RUOc95wDtwFXoPAbWi7OzJVlSz0M0sp1xfYraI87IaAIrxxtBZks/C4LGei03Q3WQ9W/F
	 aHzlbkboy3WPKdJTV4C1A8SyuJ4nHP1G3dP4JsRCfSwBj6eqsQizi2orE4kMAutln7J3D
	 TQuLJ7VWHC7BG5a8mZwJhXzLAQPmTGH/3JeUYVSLe4OCR6r/ObNmbz71Zmt2KxGt4XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904036;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=owaKlD8oLnDzryLHo6z1T1KNQuIMA+s07F6t1tORQy4=;
	b=SuUBPU1jq2rnbmFmF4/oOb9SY7oXbWuRvrV6fU1oyCDWluCUaOj+SGysmSyMRT4Zp+VE
	 zkgX7391Cl8v6GXfauICiyQR2WZV6m8JqXxIhKUUvo5nG7Y0JuP2YvmNfHrXmBOsKjcPO
	 fgo+gflFNNx7OeM/2lQTrPc9ye+qbQaIXhUqq5cvVAPfY/uUsfW3VYaC5cwNG1GRWRe66
	 65RMwH48N7UBFzUhzRm3aUFl3CBNVLHH5qIPP/sxb5EBOh3d9Plo61KlPZuazHjUo75dp
	 7N3DvHroRcM2dzB55pHNBIC/l1y8NLlk8uyJGDLOrgM5WIuHZPkWmARUbBFfzC0mgsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KxNA6PQR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA024606D801;
	Thu,  5 Nov 2026 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KxNA6PQR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808641F000C1;
	Thu,  5 Nov 2026 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904035;
	bh=owaKlD8oLnDzryLHo6z1T1KNQuIMA+s07F6t1tORQy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KxNA6PQRF/ooZDITVNYoeJsxh4blye8mGQicqkeLhnzx3sSR9Wpuy6bYC6WxhdRnI
	 iLpDZjY5rLhESJYSNt29rrC7kK7yblLO1JI5Sm6IBTIL/415UWOM1iSivDbErdGXTa
	 wsizeELBGl3kKFfJX3oDSrnVkaTG+NxvmuS4IP+I7WoWo98tJ6Pps3Jh3/zhte7fkF
	 Vk8uVFUMewyZpRKHPH95MkQLSi9G1Md6TW0XR8mU9tpdMx4Y1toRDo5gCDApTTwcgf
	 Bv7OGeNkDm+i3rvZHQgkImZZCjl6GPlSCf2nBo+s3nzgrzii4vn9/rHly0leinzsMW
	 gmoF4aZHXHRLQ==
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wentao Liang <vulab@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] soc: microchip: mpfs-sys-controller: put the flash device reference
Date: Thu,  5 Nov 2026 18:39:44 +0000
Message-ID: <179390394386.1477457.365561090513206596.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104021435.1468301-1-vulab@iscas.ac.cn>
References: <20261104021435.1468301-1-vulab@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=646; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ie3smbEtm3ecVbEoJiIqxoXtQG2xYonjbXDjOLJfKXU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzuZ+nl7jcuvbt2/TOHL3dQb35l1MTy9QvmnGrTGFQ XCqkUBNRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZyX5WR4ZjG0biI+Hv6ERf6 NQyTq2+J/rpqOW/TFlkXk2NG9pc2nmRk2MIlmZt3oZfx+xMzKWWR4JgCXUPxnwKu5hWKVw8r7J7 PAAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 04 Nov 2026 02:14:35 +0000, Wentao Liang wrote:
> of_get_mtd_device_by_node() returns an mtd_info with a reference taken
> on the MTD device, which is stored in sys_controller->flash.  The
> reference is never released, neither when the last sys_controller user
> goes away nor on the probe error path that frees a freshly allocated
> controller without initialising the kref.
> 
> Balance it with put_mtd_device() in both places.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] soc: microchip: mpfs-sys-controller: put the flash device reference
      https://git.kernel.org/conor/c/6fdd47bf3736

Thanks,
Conor.
