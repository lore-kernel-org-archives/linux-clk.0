Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8189A;
	Tue,  5 Dec 2023 01:52:38 -0800 (PST)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rAS6K-0006aC-6u; Tue, 05 Dec 2023 10:52:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	daniel@ffwll.ch,
	tzimmermann@suse.de,
	linux-clk@vger.kernel.org,
	conor+dt@kernel.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	neil.armstrong@linaro.org,
	Chris Morgan <macromorgan@hotmail.com>,
	javierm@redhat.com,
	sboyd@kernel.org,
	sam@ravnborg.org,
	mripard@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	airlied@gmail.com,
	mturquette@baylibre.com
Subject: Re: (subset) [PATCH V2 00/10] rockchip: Add Powkiddy X55
Date: Tue,  5 Dec 2023 10:52:22 +0100
Message-Id: <170176993501.528247.5450175586364126094.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 4 Dec 2023 12:57:09 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Rockchip RK3566 based Powkiddy X55 handheld gaming
> console.
> 
> Changes since V1:
>  - Corrected a bug with the DRM mode flags for the video driver.
>  - Adjusted panel front and back porch and pixel clock to fix
>    issues with display that occurred after correcting DRM mode
>    flag bug.
>  - Add a new clk frequency for PLL_VPLL to get panel to run at ~60hz.
> 
> [...]

Applied, thanks!

[07/10] clk: rockchip: Mark pclk_usb as critical on rk3568
        commit: 721bf080f249ab2adcc4337abe164230bfb8594f
[08/10] clk: rockchip: rk3568: Add PLL rate for 126.4MHz
        commit: 685da6972647b486980c0cc8fd6bb5d3863fd6b7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
